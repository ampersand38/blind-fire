#include "script_component.hpp"
/*
 * Author: Ampersand
 * Returns position a given distance in front of muzzle of the weapon proxy
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Direction <NUMBER> 0: Down, 1: Left, 2: Right
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [_unit, 0] call blf_main_fnc_attachDummy
 */

params ["_unit", ["_direction", 0]];

private _offset = [
    // Rifle
    [0, 0, -1],
    [0, 0, -1],
    [0, 0, -1],
    // Launcher
    [0, 0, -1],
    [0, 0, 0],
    [0, 0, 0],
    // Handgun
    [0, 0, -1],
    [0, 0, 0],
    [0, 0, 0]
] select (GVAR(loadoutIndex) * 3 + _direction);

GVAR(vectorDirAndUp = [
    // Rifle
    [[0, 1, 0], [0, 0, 1]],
    [[0, 1, 0], [0, 0, 1]],
    [[0, 1, 0], [0, 0, 1]],
    // Launcher
    [[0, 1, 0], [0, 0, 1]],
    [[0, 1, 0], [0, 0, 1]],
    [[0, 1, 0], [0, 0, 1]],
    // Handgun
    [[0, 0, -1], [0, 1, 0]],
    [[0, 0, -1], [0, 1, 0]],
    [[0, 0, -1], [0, 1, 0]]
] select (GVAR(loadoutIndex) * 3 + _direction);

//GVAR(dummy) attachTo [_unit, [0,0,0], GVAR(proxy), true];
GVAR(dummy) attachTo [_unit, _offset, GVAR(proxy), true];
GVAR(dummy) setVectorDirAndUp GVAR(vectorDirAndUp);
