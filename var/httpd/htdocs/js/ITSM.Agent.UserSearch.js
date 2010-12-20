// --
// ITSM.Agent.UserSearch.js - provides the special module functions for the user search
// Copyright (C) 2001-2010 OTRS AG, http://otrs.org/\n";
// --
// $Id: ITSM.Agent.UserSearch.js,v 1.3 2010/12/20 17:56:44 dz Exp $
// --
// This software comes with ABSOLUTELY NO WARRANTY. For details, see
// the enclosed file COPYING for license information (AGPL). If you
// did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
// --

"use strict";

var ITSM = ITSM || {};
ITSM.Agent = ITSM.Agent || {};

/**
 * @namespace
 * @exports TargetNS as ITSM.Agent.UserSearch
 * @description
 *      This namespace contains the special module functions for the user search.
 */
ITSM.Agent.UserSearch = (function (TargetNS) {

    /**
     * @function
     * @param {jQueryObject} $Element The jQuery object of the input field with autocomplete
     * @param {Boolean} ActiveAutoComplete Set to false, if autocomplete should only be started by click on a button next to the input field
     * @return nothing
     *      This function initializes the special module functions
     */
    TargetNS.Init = function ($Element, ActiveAutoComplete) {

        if (typeof ActiveAutoComplete === 'undefined') {
            ActiveAutoComplete = true;
        }
        else {
            ActiveAutoComplete = !!ActiveAutoComplete;
        }

        if (isJQueryObject($Element)) {
            $Element.autocomplete({
                minLength: ActiveAutoComplete ? Core.Config.Get('UserAutocomplete.MinQueryLength') : 500,
                delay: Core.Config.Get('UserAutocomplete.QueryDelay'),
                source: function (Request, Response) {
                    var URL = Core.Config.Get('Baselink'), Data = {
                        Action: 'AgentITSMUserSearch',
                        Term: Request.term + '*',
                        MaxResults: Core.Config.Get('UserAutocomplete.MaxResultsDisplayed'),
                        Groups : Core.Config.Get('UserAutocomplete.Groups') || '',
                    };
                    Core.AJAX.FunctionCall(URL, Data, function (Result) {
                        var Data = [];
                        $.each(Result, function () {
                            Data.push({
                                label: this.UserValue + " (" + this.UserKey + ")",
                                value: this.UserValue
                            });
                        });
                        Response(Data);
                    });
                },
                select: function (Event, UI) {
                    var UserKey = UI.item.label.replace(/.*\((.*)\)$/, '$1');

                    $Element.val(UI.item.value);

                    // set hidden field SelectedCustomerUser
                    $('#' + $Element.attr('id') + 'Selected').val(UserKey);

                    return false;
                }
            });

            if (!ActiveAutoComplete) {
                $Element.after('<button id="' + $Element.attr('id') + 'Search" type="button">' + Core.Config.Get('UserAutocomplete.SearchButtonText') + '</button>');
                $('#' + $Element.attr('id') + 'Search').click(function () {
                    $Element.autocomplete("option", "minLength", 0);
                    $Element.autocomplete("search");
                    $Element.autocomplete("option", "minLength", 500);
                });
            }
        }

        // On unload remove old selected data. If the page is reloaded (with F5) this data stays in the field and invokes an ajax request otherwise
        $(window).bind('unload', function () {
           $('#' + $Element.attr('id') + 'Selected').val('');
        });
    };

    return TargetNS;
}(ITSM.Agent.UserSearch || {}));