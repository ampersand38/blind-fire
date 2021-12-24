#include "script_component.hpp"
/*
 * Author: Ampersand
 * Sets the weapon to end up with then stop blind fire.
 *
 * Arguments:
 * 0: Loadout Index <NUMBER>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [0] call blf_main_fnc_inputStop
 */

params ["_i"];
if (isNull GVAR(dummy)) exitWith {};

private _unit = call CBA_fnc_currentUnit;
private _currWeapon = currentWeapon _unit;
private _wRifle = primaryWeapon _unit;
private _wLauncher = secondaryWeapon _unit;
private _wPistol = handgunWeapon _unit;

private _endWeapon = [
    _wRifle,
    _wLauncher,
    _wPistol,
    [_wLauncher, _wRifle] select (_currWeapon == _wLauncher),
    [_wPistol, _wRifle] select (_currWeapon == _wPistol)
] select _i;

if (_endWeapon == _currWeapon) exitWith {};

GVAR(endWeapon) = _endWeapon;
deleteVehicle GVAR(dummy);
