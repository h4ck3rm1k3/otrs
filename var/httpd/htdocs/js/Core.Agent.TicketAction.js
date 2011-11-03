// --
// Core.Agent.TicketAction.js - provides functions for all ticket action popups
// Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
// --
// $Id: Core.Agent.TicketAction.js,v 1.11 2011/10/31 11:10:06 mg Exp $
// --
// This software comes with ABSOLUTELY NO WARRANTY. For details, see
// the enclosed file COPYING for license information (AGPL). If you
// did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
// --

"use strict";

var Core = Core || {};
Core.Agent = Core.Agent || {};

/**
 * @namespace
 * @exports TargetNS as Core.Agent.TicketAction
 * @description
 *      This namespace contains functions for all ticket action popups.
 */
Core.Agent.TicketAction = (function (TargetNS) {

    /**
     * @function
     * @private
     * @return nothing
     * @description Open the spellchecker screen
     */
    function OpenSpellChecker() {
        var SpellCheckIFrame, SpellCheckIFrameURL;
        SpellCheckIFrameURL = Core.Config.Get('CGIHandle') + '?Action=AgentSpelling;Field=RichText;Body=' + encodeURIComponent($('#RichText').val());
        SpellCheckIFrame = '<iframe class="TextOption SpellCheck" src="' + SpellCheckIFrameURL + '"></iframe>';
        Core.UI.Dialog.ShowContentDialog(SpellCheckIFrame, '', '10px', 'Center', true);
    }

    /**
     * @function
     * @private
     * @return nothing
     * @description Open the AddressBook screen
     */
    function OpenAddressBook() {
        var AddressBookIFrameURL, AddressBookIFrame;
        AddressBookIFrameURL = Core.Config.Get('CGIHandle') + '?Action=AgentBook;To=' + encodeURIComponent($('#CustomerAutoComplete').val()) + ';Cc=' + encodeURIComponent($('#Cc').val()) + ';Bcc=' + encodeURIComponent($('#Bcc').val());
        AddressBookIFrame = '<iframe class="TextOption" src="' + AddressBookIFrameURL + '"></iframe>';
        Core.UI.Dialog.ShowContentDialog(AddressBookIFrame, '', '10px', 'Center', true);
    }

    /**
     * @function
     * @private
     * @return nothing
     * @description Open the CustomerDialog screen
     */
    function OpenCustomerDialog() {
        var CustomerIFrame = '<iframe class="TextOption Customer" src="' + Core.Config.Get('CGIHandle') + '?Action=AdminCustomerUser;Nav=None;Subject=;What="></iframe>';
        Core.UI.Dialog.ShowContentDialog(CustomerIFrame, '', '10px', 'Center', true);
    }

    /**
     * @function
     * @private
     * @param {Object} $Link Element link type that will receive the new email adrress in his value attribute
     * @return nothing
     * @description Open the spellchecker screen
     */
    function AddMailAddress($Link) {
        var $Element = $('#' + $Link.attr('rel')),
            NewValue = $Element.val();
        if (NewValue.length) {
            NewValue = NewValue + ', ';
        }
        NewValue = NewValue + Core.Data.Get($Link.closest('tr'), 'Email');
        $Element.val(NewValue);
    }

    /**
     * @function
     * @description
     *      This function initializes the ticket action popups
     * @return nothing
     */
    TargetNS.Init = function () {
        // Register event for spell checker dialog
        $('#OptionSpellCheck').bind('click', function (Event) {
            OpenSpellChecker();
            return false;
        });

        // Register event for addressbook dialog
        $('#OptionAddressBook').bind('click', function (Event) {
            OpenAddressBook();
            return false;
        });

        // Register event for customer dialog
        $('#OptionCustomer').bind('click', function (Event) {
            OpenCustomerDialog();
            return false;
        });
    };

    /**
     * @function
     * @return nothing
     *      This function initializes the necessary stuff for address book link in TicketAction screens
     */
    TargetNS.InitAddressBook = function () {
        // Register event for copying mail address to input field
        $('#SearchResult a').bind('click', function (Event) {
            AddMailAddress($(this));
            return false;
        });

        // Register Apply button event
        $('#Apply').bind('click', function (Event) {
            // Update ticket action popup fields
            var $To = $('#CustomerAutoComplete', parent.document),
                $Cc = $('#Cc', parent.document),
                $Bcc = $('#Bcc', parent.document);

            $To.val($('#To').val());
            $Cc.val($('#Cc').val());
            $Bcc.val($('#Bcc').val());

            // Because we are in an iframe, we need to call the parent frames javascript function
            // with a jQuery object which is in the parent frames context
            parent.Core.UI.Dialog.CloseDialog($('.Dialog', parent.document));
        });

        // Register Cancel button event
        $('#Cancel').bind('click', function (Event) {
            // Because we are in an iframe, we need to call the parent frames javascript function
            // with a jQuery object which is in the parent frames context
            parent.Core.UI.Dialog.CloseDialog($('.Dialog', parent.document));
        });
    };

    /**
     * @function
     * @return nothing
     *      This function initializes the necessary stuff for spell check link  in TicketAction screens
     */
    TargetNS.InitSpellCheck = function () {
        // Register onchange event for dropdown and input field to change the radiobutton
        $('#SpellCheck select, #SpellCheck input:text').bind('change', function (Event) {
            var $Row = $(this).closest('tr'),
                RowCount = parseInt($Row.attr('id').replace(/Row/, ''), 10);
            $Row.find('input:radio[id=ChangeWord' + RowCount + ']').attr('checked', 'checked');
        });

        // Register Apply button event
        $('#Apply').bind('click', function (Event) {
            // Update ticket action popup fields
            var FieldName = $('#Field').val(),
                $Body = $('#' + FieldName, parent.document);

            $Body.val($('#Body').val());

            // Because we are in an iframe, we need to call the parent frames javascript function
            // with a jQuery object which is in the parent frames context
            parent.Core.UI.Dialog.CloseDialog($('.Dialog', parent.document));
        });

        // Register Cancel button event
        $('#Cancel').bind('click', function (Event) {
            // Because we are in an iframe, we need to call the parent frames javascript function
            // with a jQuery object which is in the parent frames context
            parent.Core.UI.Dialog.CloseDialog($('.Dialog', parent.document));
        });
    };

    /**
     * @function
     * @param
     *      {String} Customer The customer that was selected in the customer popup window
     * @return nothing
     * @description
     *      In some screens, the customer management dialog can be used as a borrowed view
     *      (iframe in a dialog). This function is used to take over the currently selected
     *      customer into the main window, closing the dialog.
     */
    TargetNS.UpdateCustomer = function (Customer) {
        var $UpdateForm = $('form[name=compose]', parent.document);
        $UpdateForm
            .find('#ExpandCustomerName').val('2')
            .end()
            .find('#PreSelectedCustomerUser').val(Customer)
            .end()
            .submit();

        // Because we are in an iframe, we need to call the parent frames javascript function
        // with a jQuery object which is in the parent frames context
        parent.Core.UI.Dialog.CloseDialog($('.Dialog', parent.document));
    };

    /**
     * @function
     * @return nothing
     *      Selects a radio button by name and value
     * @param {Value} The value attribute of the radio button to be selected
     * @param {Object} The name of the radio button to be selected
     */
    TargetNS.SelectRadioButton = function (Value, Name) {
        $('input:radio[name=' + Name + '][value=' + Value + ']').attr('checked', 'checked');
    };

    return TargetNS;
}(Core.Agent.TicketAction || {}));
