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

if (!isNull GVAR(dummy)) exitWith {deleteVehicle GVAR(dummy)};

GVAR(unit) = call CBA_fnc_currentUnit;
if (!isNull objectParent GVAR(unit)) exitWith {deleteVehicle GVAR(dummy)};

private _cfg = configFile >> "CfgWeapons" >> currentWeapon GVAR(unit);
private _weaponType = getNumber (_cfg >> "type"); // Rifle: 1, Pistol: 2, Launcher: 4
GVAR(loadoutIndex) = [1, 4, 2] find _weaponType; // loadout order
if (GVAR(loadoutIndex) < 0) exitWith {deleteVehicle GVAR(dummy)};
private _unitLoadout = getUnitLoadout GVAR(unit);
GVAR(muzzle) = currentMuzzle GVAR(unit);

GVAR(proxy) = [
    "proxy:\a3\characters_f\proxies\weapon.001",
    "proxy:\a3\characters_f\proxies\launcher.001",
    "proxy:\a3\characters_f\proxies\pistol.001"
] select GVAR(loadoutIndex);

// Prep dummy
private _move = format ["AmovPercMstpSrasW%1Dnon", ["rfl", "lnr", "pst"] select GVAR(loadoutIndex)];
GVAR(dummy) = createAgent [QGVAR(dummy), [0, 0, 0], [], 0, "CAN_COLLIDE"];
//GVAR(dummy) = createAgent ["B_Soldier_VR_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
if (isNull GVAR(dummy)) exitWith {
    systemChat "could not create dummy";
};
GVAR(dummy) disableAI "ALL";
private _loadout = getUnitLoadout GVAR(dummy);
_loadout set [GVAR(loadoutIndex), _unitLoadout select GVAR(loadoutIndex)];
GVAR(dummy) setUnitLoadout _loadout;
GVAR(dummy) switchmove _move;
GVAR(dummy) addEventHandler ["Deleted", {
	params ["_dummy"];
    private _loadout = getUnitLoadout _dummy;
    private _unitLoadout = getUnitLoadout GVAR(unit);
    _unitLoadout set [GVAR(loadoutIndex), _loadout select GVAR(loadoutIndex)];
    GVAR(unit) setUnitLoadout _unitLoadout;
    {
        call CBA_fnc_currentUnit removeEventHandler _x;
    } forEach GVAR(eventHandlers);
    #include "..\initVars.hpp"
}];

[] call FUNC(attachDummy);

// Prep player unit
_unitLoadout set [GVAR(loadoutIndex), [
    [QGVAR(FakeRifle),"","","",[QGVAR(1000Rnd_Mag), _unitLoadout # 0 # 4 # 1],[],""],
    ["launch_MRAWS_sand_F","","","",["MRAWS_HEAT_F",1],[],""],
    ["hgun_P07_F","","","",["16Rnd_9x21_Mag",16],[],""]
] select GVAR(loadoutIndex)];
GVAR(unit) setUnitLoadout _unitLoadout;
GVAR(eventHandlers) pushBack ["Fired", GVAR(unit) addEventHandler ["Fired", {
	//params ["_unit", "_weapon", "_muzzle", "_fireMode", "_ammo", "_magazine", "_projectile", "_gunner"];
	params ["", "", "", "_fireMode", "", "", "_projectile"];
    //systemChat str _this;
    GVAR(dummy) forceWeaponFire [GVAR(muzzle), _fireMode];
    deleteVehicle _projectile;
    if (GVAR(unit) ammo currentMuzzle GVAR(unit) == 0) then { deleteVehicle GVAR(dummy); };
}]];
GVAR(eventHandlers) pushBack ["AnimStateChanged", GVAR(unit) addEventHandler ["AnimStateChanged", {
	params ["_unit", "_anim"];
    if (
        currentWeapon GVAR(unit) != QGVAR(FakeRifle)
    ) then {
        deleteVehicle GVAR(dummy)
    };
}]];



{
  _x addCuratorEditableObjects [[GVAR(dummy)], true];
} forEach allCurators;
BIS_tracedShooter = nil;
[GVAR(dummy), 10] call BIS_fnc_traceBullets;
