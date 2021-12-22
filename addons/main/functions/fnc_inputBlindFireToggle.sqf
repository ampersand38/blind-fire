#include "script_component.hpp"
/*
 * Author: Ampersand
 * Handles input Blind Fire (Toggle)
 *
 * Arguments:
 * 0: Input <BOOLEAN>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * true call blf_main_fnc_inputBlindFireToggle
 */

private _fnc_exit = {
    deleteVehicle GVAR(dummy);
    {
        _unit removeEventHandler _x;
    } forEach GVAR(eventHandlers);
    GVAR(eventHandlers) = [];
    GVAR(proxy) = "";
    GVAR(vectorDirAndUp) = [[0, 1, 0], [0, 0, 1]];
};

if (!isNull GVAR(dummy)) exitWith _fnc_exit;

private _unit = call CBA_fnc_currentUnit;
if (!isNull objectParent _unit) exitWith _fnc_exit;

private _weapon = currentWeapon _unit;
private _cfg = configFile >> "CfgWeapons" >> _weapon;
private _weaponType = getNumber (_cfg >> "type"); // Rifle: 1, Pistol: 2, Launcher: 4
GVAR(loadoutIndex) = [1, 4, 2] find _weaponType; // loadout order
if (GVAR(loadoutIndex) < 0) exitWith _fnc_exit;

GVAR(proxy) = [
    "proxy:\a3\characters_f\proxies\weapon.001",
    "proxy:\a3\characters_f\proxies\launcher.001",
    "proxy:\a3\characters_f\proxies\pistol.001"
] select GVAR(loadoutIndex);

// Prep dummy
private _move = format ["AmovPercMstpSrasW%1Dnon", ["rfl", "lnr", "pst"] select GVAR(loadoutIndex)];
GVAR(dummy) = createAgent ["B_Soldier_VR_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
GVAR(dummy) disableAI "ALL";
private _loadout = getUnitLoadout GVAR(dummy);
private _weapon = getUnitLoadout _unit select GVAR(loadoutIndex);
_loadout set [GVAR(loadoutIndex), _weapon];
GVAR(dummy) setUnitLoadout _loadout;
GVAR(dummy) switchmove _move;

_direction = 2;
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

//GVAR(dummy) attachTo [_unit, [0,0,0], GVAR(proxy), true];
GVAR(dummy) attachTo [_unit, _offset, GVAR(proxy), true];
GVAR(dummy) setVectorDirAndUp GVAR(vectorDirAndUp);

// Prep player unit
GVAR(eventHandlers) pushBack ["Fired", _unit addEventHandler ["Fired", {
	params ["_unit", "_weapon", "_muzzle", "_fireMode", "_ammo", "_magazine", "_projectile", "_gunner"];
	//params ["", "", "_muzzle", "_fireMode"];
    GVAR(dummy) forceWeaponFire [_muzzle, _fireMode];
    private _weaponPos = _unit modelToWorldVisualWorld (_unit selectionPosition ["weapon", "Memory"]);
    private _projectilePos = (((getPosASL _projectile)));
    private _offset = (_projectilePos vectorDiff _weaponPos);
    private _weaponDir = _unit weaponDirection _weapon;
    diag_log (_offset vectorDiff _weaponDir);
    diag_log (_projectilePos distance _weaponPos);
    deleteVehicle _projectile;
}]];
/*

BIS_tracedShooter = nil;
[GVAR(dummy), 10] call BIS_fnc_traceBullets;
