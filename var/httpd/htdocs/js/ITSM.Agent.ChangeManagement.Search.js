// --
// ITSM.Agent.ChangeManagemnt.Search.js - provides the special module functions for the global search
// Copyright (C) 2001-2010 OTRS AG, http://otrs.org/\n";
// --
// $Id: ITSM.Agent.ChangeManagement.Search.js,v 1.2 2010/12/16 05:06:29 cr Exp $
// --
// This software comes with ABSOLUTELY NO WARRANTY. For details, see
// the enclosed file COPYING for license information (AGPL). If you
// did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
// --

"use strict";

var ITSM = ITSM || {};
ITSM.Agent = ITSM.Agent || {};
ITSM.Agent.ChangeManagement = ITSM.Agent.ChangeManagement || {};

/**
 * @namespace
 * @exports TargetNS as Core.Agent.Search
 * @description
 *      This namespace contains the special module functions for the search.
 */
ITSM.Agent.ChangeManagement.Search = (function (TargetNS) {

    /**
     * @function
     * @return nothing
     *      This function rebuild attribute selection, only show available attributes.
     */
    TargetNS.AdditionalAttributeSelectionRebuild = function () {

        // get original selection with all possible fields and clone it
        var $AttributeClone = $('#AttributeOrig').clone().attr('id', 'Attribute');

        // strip all already used attributes
        $AttributeClone.find('option').each(function () {
            $('#SearchInsert label#' + 'Label' + $(this).attr('value')).remove();
        });

        // replace selection with original selection
        $('#Attribute').replaceWith($AttributeClone);

        return true;
    };

    /**
     * @function
     * @param {String} of attribute to add.
     * @return nothing
     *      This function adds one attributes for search.
     */
    TargetNS.SearchAttributeAdd = function (Attribute) {
        var $Label = $('#SearchAttributesHidden label#Label' + Attribute);

        if ($Label.length) {
            $Label.prev().clone().appendTo('#SearchInsert');
            $Label.clone().appendTo('#SearchInsert');
            $Label.next().clone().appendTo('#SearchInsert')

                // bind click function to remove button now
                .find('.Remove').bind('click', function () {
                    var $Element = $(this).parent();
                    TargetNS.SearchAttributeRemove($Element);

                    // rebuild selection
                    TargetNS.AdditionalAttributeSelectionRebuild();

                    return false;
                });

            // set autocomple to customer type fields
            $('#SearchInsert').find('.ITSMCustomerSearch').each(function(){
                var InputID = $(this).attr('id') + 'CustomerAutocomplete';
                $(this).removeClass('ITSMCustomerSearch');
                $(this).attr('id', InputID);
                $(this).prev().attr('id', InputID + 'Selected');
                ITSM.Agent.CustomerSearch.Init($('#' + InputID), Core.Config.Get('Autocomplete.Active'));

                // prevent dialog closure when select a customer from the list
                $('ul.ui-autocomplete').bind('click', function(Event){
                    Event.stopPropagation();
                    return false;
                });
            });

            // set autocomple to user type fields
            $('#SearchInsert').find('.ITSMUserSearch').each(function(){
                var InputID = $(this).attr('id') + 'UserAutocomplete';
                $(this).removeClass('ITSMUserSearch');
                $(this).attr('id', InputID);
                $(this).prev().attr('id', InputID + 'Selected');
                ITSM.Agent.UserSearch.Init($('#' + InputID), Core.Config.Get('Autocomplete.Active'));

                // prevent dialog closure when select a customer from the list
                $('ul.ui-autocomplete').bind('click', function(Event){
                    Event.stopPropagation();
                    return false;
                });
            });

        }

        return false;
    };

    /**
     * @function
     * @param {jQueryObject} $Element The jQuery object of the form  or any element
     *      within this form check.
     * @return nothing
     *      This function remove attributes from an element.
     */

    TargetNS.SearchAttributeRemove = function ($Element) {
        $Element.prev().prev().remove();
        $Element.prev().remove();
        $Element.remove();
    };

    /**
     * @function
     * @return nothing
     *      This function rebuild attribute selection, only show available attributes.
     */
    TargetNS.AdditionalAttributeSelectionRebuild = function () {

        // get original selection
        var $AttributeClone = $('#AttributeOrig').clone();
        $AttributeClone.attr('id', 'Attribute');

        // strip all already used attributes
        $AttributeClone.find('option').each(function () {
            var $Attribute = $(this);
            $('#SearchInsert label').each(function () {
                if ($(this).attr('id') === 'Label' + $Attribute.attr('value')) {
                    $Attribute.remove();
                }
            });
        });

        // replace selection with original selection
        $('#Attribute').replaceWith($AttributeClone);

        return true;
    };

    /**
     * @function
     * @private
     * @param {String} Profile The profile name that will be delete.
     * @return nothing
     * @description Delete a profile via an ajax requests.
     */
    function SearchProfileDelete(Profile) {
        var Data = {
            Action: 'AgentITSMChangeSearch',
            Subaction: 'AJAXProfileDelete',
            Profile: Profile
        };
        Core.AJAX.FunctionCall(
            Core.Config.Get('CGIHandle'),
            Data,
            function () {}
        );
    }

    /**
     * @function
     * @private
     * @return nothing
     * @description Shows waiting dialog until search screen is ready.
     */
    function ShowWaitingDialog(){
        Core.UI.Dialog.ShowContentDialog('<div class="Spacing Center"><span class="AJAXLoader" title="' + Core.Config.Get('LoadingMsg') + '"></span></div>', Core.Config.Get('LoadingMsg'), '10px', 'Center', true);
    }

    /**
     * @function
     * @param {String} Action which is used in framework right now.
     * @param {String} Used profile name.
     * @return nothing
     *      This function open the search dialog after clicking on "search" button in nav bar.
     */

    TargetNS.OpenSearchDialog = function (Action, Profile, EmptySearch) {

        var Referrer = Core.Config.Get('Action'),
            Data;

        if (!Action) {
            Action = 'AgentSearch';
        }

        Data = {
            Action: Action,
            Referrer: Referrer,
            Profile: Profile,
            EmptySearch: EmptySearch,
            Subaction: 'AJAX'
        };

        ShowWaitingDialog();

        Core.AJAX.FunctionCall(
            Core.Config.Get('CGIHandle'),
            Data,
            function (HTML) {
                // if the waiting dialog was cancelled, do not show the search
                //  dialog as well
                if (!$('.Dialog:visible').length) {
                    return;
                }

                Core.UI.Dialog.ShowContentDialog(HTML, Core.Config.Get('SearchMsg'), '10px', 'Center', true);

                // hide add template block
                $('#SearchProfileAddBlock').hide();

                // hide save changes in template block
                $('#SaveProfile').parent().hide().prev().hide().prev().hide();

                // search profile is selected
                if ($('#SearchProfile').val() && $('#SearchProfile').val() !== 'last-search') {

                    // show delete button
                    $('#SearchProfileDelete').show();

                    // show save changes in template block
                    $('#SaveProfile').parent().show().prev().show().prev().show();

                    // set SaveProfile to 0
                    $('#SaveProfile').attr('checked', false);
                }

                // register add of attribute
                $('.Add').bind('click', function () {
                    var Attribute = $('#Attribute').val();
                    TargetNS.SearchAttributeAdd(Attribute);
                    TargetNS.AdditionalAttributeSelectionRebuild();

                    return false;
                });

                // register return key
                $('#SearchForm').unbind('keypress.FilterInput').bind('keypress.FilterInput', function (Event) {
                    if ((Event.charCode || Event.keyCode) === 13) {
                        $('#SearchForm').submit();
                        return false;
                    }
                });

                // register submit
                $('#SearchFormSubmit').bind('click', function () {
                    // Normal results mode will return HTML in the same window
                    if ($('#SearchForm #ResultForm').val() === 'Normal') {
                        $('#SearchForm').submit();
                        ShowWaitingDialog();
                    }
                    else { // Print and CSV should open in a new window, no waiting dialog
                        $('#SearchForm').attr('target', 'SearchResultPage');
                        $('#SearchForm').submit();
                        $('#SearchForm').attr('target', '');
                    }
                    return false;
                });

                // load profile
                $('#SearchProfile').bind('change', function () {
                    var Profile = $('#SearchProfile').val(),
                        EmptySearch = $('#EmptySearch').val(),
                        Action = $('#SearchAction').val();

                    TargetNS.OpenSearchDialog(Action, Profile, EmptySearch);
                    return false;
                });

                // show add profile block or not
                $('#SearchProfileNew').bind('click', function (Event) {
                    $('#SearchProfileAddBlock').toggle();
                    Event.preventDefault();
                    return false;
                });

                // add new profile
                $('#SearchProfileAddAction').bind('click', function () {
                    var Name, $Element1;

                    // get name
                    Name = $('#SearchProfileAddName').val();
                    if (!Name) {
                        return false;
                    }

                    // add name to profile selection
                    $Element1 = $('#SearchProfile').children().first().clone();
                    $Element1.text(Name);
                    $Element1.attr('value', Name);
                    $Element1.attr('selected', 'selected');
                    $('#SearchProfile').append($Element1);

                    // set input box to empty
                    $('#SearchProfileAddName').val('');

                    // hide add template block
                    $('#SearchProfileAddBlock').hide();

                    // hide save changes in template block
                    $('#SaveProfile').parent().hide().prev().hide().prev().hide();

                    // set SaveProfile to 1
                    $('#SaveProfile').attr('checked', true);

                    $('#SearchProfileDelete').show();

                    return false;
                });

                // delete profile
                $('#SearchProfileDelete').bind('click', function (Event) {

                    // strip all already used attributes
                    $('#SearchProfile').find('option:selected').each(function () {
                        if ($(this).attr('value') !== 'last-search') {

                            // rebuild attributes
                            $('#SearchInsert').text('');

                            // remove remote
                            SearchProfileDelete($(this).val());

                            // remove local
                            $(this).remove();

                            // show fulltext
                            TargetNS.SearchAttributeAdd('Fulltext');

                            // rebuild selection
                            TargetNS.AdditionalAttributeSelectionRebuild();
                        }
                    });

                    if ($('#SearchProfile').val() && $('#SearchProfile').val() === 'last-search') {
                        $('#SearchProfileDelete').hide();
                    }

                    Event.preventDefault();
                    return false;
                });

            }, 'html'
        );
    };

    return TargetNS;
}(ITSM.Agent.ChangeManagement.Search || {}));
