#include "script_component.hpp"
/*
 * Author: Ampersand
 * Handles input Blind Fire (Toggle)
 *
 * Arguments:
 * 0: Input <BOOLEAN|NUMBER>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * true call blf_main_fnc_inputBlindFireToggle
 */

private _input = if (_this isEqualType false) then {
    _this
} else {
    if (_this isEqualType 0) then {
        _this > 0
    };
};

systemChat format ["%1 %2", diag_frameno, _this];
