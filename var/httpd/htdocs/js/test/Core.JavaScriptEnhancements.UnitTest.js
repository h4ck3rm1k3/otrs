// --
// Core.JavaScriptEnhancements.UnitTest.js - UnitTests
// Copyright (C) 2001-2010 OTRS AG, http://otrs.org/\n";
// --
// $Id: Core.JavaScriptEnhancements.UnitTest.js,v 1.2 2010/11/05 10:12:10 mg Exp $
// --
// This software comes with ABSOLUTELY NO WARRANTY. For details, see
// the enclosed file COPYING for license information (AGPL). If you
// did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
// --

"use strict";

var OTRS = OTRS || {};

Core.JavaScriptEnhancements = {};
Core.JavaScriptEnhancements.RunUnitTests = function(){

    module('Core.JavaScriptEnhancements');

    test('isJQueryObject()', function(){
        expect(6);

        equals(isJQueryObject($([])), true, 'empty jQuery object');
        equals(isJQueryObject($('body')), true, 'simple jQuery object');
        equals(isJQueryObject({}), false, 'plain object');
        equals(isJQueryObject(undefined), false, 'undefined');
        equals(isJQueryObject($([]), $([])), true, 'multiple');
        equals(isJQueryObject($([]), $([]), {}), false, 'multiple, one plain object');
    });
};