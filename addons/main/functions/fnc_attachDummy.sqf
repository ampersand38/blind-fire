#include "script_component.hpp"
/*
 * Author: Ampersand
 * Returns position a given distance in front of muzzle of the weapon proxy
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Direction <NUMBER> -1: Left, 1: Right
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [1] call blf_main_fnc_attachDummy
 */

params [["_direction", 0]];

if (isNull GVAR(dummy)) exitWith {};

GVAR(direction) = 0 max (GVAR(direction) + _direction) min 2;

private _index = GVAR(loadoutIndex) * 3 + GVAR(direction);
if (_index < 0 || {_index > 8}) exitWith {};
private _offset = [
    // Rifle
    [0,0,0],
    [0,0.12,0.02],
    [0,0,0],
    // Launcher
    [0,0.4,0],
    [0,0.4,0],
    [0,0.4,0],
    // Handgun
    [-0.02,0.02,-0.05],
    [0.05,0,0.02],
    [0.02,0.02,0.06]
] select _index;

GVAR(vectorDirAndUp) = [
    // Rifle
    [[-1, 1, 0], [0, 0, 1]],
    [[0, 1, -1], [0, 1, 1]],
    [[1, 1, 0], [0, 0, 1]],
    // Launcher
    [[0, 1, 1], [0, 0, 1]],
    [[-1, 1, 0], [0, 0, 1]],
    [[0, 1, -1], [0, 0, 1]],
    // Handgun
    [[0, 1, 0], [1, 1, 1]],
    [[1, 3, -1], [0, 1, 1]], // Down
    //[[0, 1, 0], [0, 1, 1]], // Forward
    [[0, 1, 0], [-1, 1, 1]]
] select _index;
/*
private _offset = [
    // Rifle
    [-0.25, -1.2, -0.5],
    [0.21, -0.5, -1.34],
    [-0.5, -0.2, -1.34],
    // Launcher
    [-1.0, -0.8, 0.1],
    [-1.6, -0.1, -0.1],
    [-1.6, 0.2, 0.2],
    // Handgun
    [-1.1, -0.65, 0.85],
    [-0.2, -1.4, 0.7],
    [-0.73, -1.4, -0.17]
] select (GVAR(loadoutIndex) * 3 + _direction);

GVAR(vectorDirAndUp) = [
    // Rifle
    [[0, 1, -1], [0, 1, 1]],
    [[-1, 1, 0], [1, 1, 0]],
    [[1, 1, 0], [0, 0, 1]],
    // Launcher
    [[-1, 1, 0], [1, 1, 0]],
    [[0, 1, 1], [1, 0, 0]],
    [[0, 1, -1], [1, 0, 0]],
    // Handgun
    [[1, -1, -1], [1, 1, -1]],
    [[0, 0, -1], [0, 1, 0]],
    [[1, 0, 0], [0, 1, 0]]
] select (GVAR(loadoutIndex) * 3 + _direction);
*/
//GVAR(dummy) attachTo [_unit, [0,0,0], GVAR(proxy), true];
GVAR(dummy) attachTo [GVAR(unit), _offset, GVAR(proxy), true];
GVAR(dummy) setVectorDirAndUp GVAR(vectorDirAndUp);
