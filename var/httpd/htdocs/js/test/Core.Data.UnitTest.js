// --
// Core.UI.Accessibility.UnitTest.js - UnitTests
// Copyright (C) 2001-2010 OTRS AG, http://otrs.org/\n";
// --
// $Id: Core.Data.UnitTest.js,v 1.2 2010/10/28 12:19:10 mg Exp $
// --
// This software comes with ABSOLUTELY NO WARRANTY. For details, see
// the enclosed file COPYING for license information (AGPL). If you
// did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
// --

"use strict";

var OTRS = OTRS || {};

Core.Data = (function (Namespace) {
    Namespace.RunUnitTests = function(){
        module('Core.Data');
        test('Core.Data.Set()', function(){

            expect(5);

            /*
             * Create a div containter for the tests
             */
            var $TestDiv = $('<div id="Container"></div>');
            $TestDiv.append('<span id="ElementOne"></span>');
            $TestDiv.append('<span id="ElementTwo"></span>');
            $('body').append($TestDiv);

            /*
             * Run the tests
             */

            var Sign = 'Save This Information';
            var ObjectOne = $('#ElementOne');
            var ObjectTwo = $('#ElementTwo');

            var ResultOneEmpty = Core.Data.Get(ObjectOne,'One');
            same(ResultOneEmpty, {}, 'information not yet stored');

            var NonexistingResuult = Core.Data.Get($('#nonexisting_selector'),'One');
            same(NonexistingResuult, {}, 'nonexisting element');

            Core.Data.Set(ObjectOne,'One',Sign);
            Core.Data.Set(ObjectTwo,'Two',Sign);

            var ResultOne = Core.Data.Get(ObjectOne,'One');
            var ResultTwo = Core.Data.Get(ObjectTwo,'Two');

            equals(ResultOne, Sign, 'okay');
            equals(ResultTwo, Sign, 'okay');
            equals(ResultOne, ResultTwo, 'okay');

             /*
             * Cleanup div container and contents
             */
            $('#Container').remove();
        });
    };

    return Namespace;
}(Core.Data || {}));