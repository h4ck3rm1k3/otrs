// --
// Core.App.js - provides the application functions
// Copyright (C) 2001-2011 OTRS AG, http://otrs.org/
// --
// $Id: Core.App.js,v 1.5 2011/02/17 21:30:59 en Exp $
// --
// This software comes with ABSOLUTELY NO WARRANTY. For details, see
// the enclosed file COPYING for license information (AGPL). If you
// did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
// --

"use strict";

var Core = Core || {};

/**
 * @namespace
 * @exports TargetNS as Core.App
 * @description
 *      This namespace contains the config options and functions.
 */
Core.App = (function (TargetNS) {

    if (!Core.Debug.CheckDependency('Core.App', 'Core.Exception', 'Core.Exception')) {
        return;
    }

    /**
     * @function
     *      This functions callback is executed if all elements and files of this page are loaded
     * @param {Function} Callback The callback function to be executed
     * @return nothing
     */
    TargetNS.Ready = function (Callback) {
        if ($.isFunction(Callback)) {
            $(document).ready(function () {
                var Trace;
                try {
                    Callback();
                }
                catch (Error) {
                    Trace = printStackTrace({e: Error, guess: true}).join('\n');
                    Core.Exception.HandleFinalError(Error, Trace);
                }
            });
        }
        else {
            Core.Exception.ShowError('No function parameter given in Core.App.Ready', 'TypeError');
        }
    };

    return TargetNS;
}(Core.App || {}));