#include "script_component.hpp"
/*
 * Author: Ampersand
 * Handles input Blind Fire (Toggle)
 *
 * Arguments:
 * 0: Direction <NUMBER>
 * 1: Input <BOOLEAN>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [0, true] call blf_main_fnc_inputAim
 */

params ["_aimDirection", "_input"];

GVAR(vectorDirAndUp) params ["_dir", "_up"];
_input = _input * GVAR(sensitivity);
private _change = [0, 1, 0];
_change set [
    [2, 2, 0, 0] select _aimDirection,
    _input * GVAR(sensitivity) * ([1, -1, -1, 1] select _aimDirection)
];
_dir = _dir vectorAdd _change;
private _left = _dir vectorCrossProduct [0, 0, -1];
_up = _dir vectorCrossProduct _left;
GVAR(vectorDirAndUp) = [_dir, _up];
GVAR(dummy) setVectorDirAndUp GVAR(vectorDirAndUp);
