#include "script_component.hpp"
/*
 * Author: Ampersand
 * Returns position a given distance in front of muzzle of the weapon proxy
 *
 * Arguments:
 * 0: Direction <NUMBER>
 * 1: Activation <BOOLEAN>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [_unit] call blf_main_fnc_muzzlePos
 */

params ["_unit"];
_w = currentWeapon _unit;

if (_w != _unit getVariable ["last_weapon", "?"]) then {
    _cfg = configFile >> "CfgWeapons" >> _w;
    _m = getText(_cfg >> "model");
    if (_m select [0,1] == "\") then {_m = _m select [1]};
    _o = createSimpleObject [_m, [0,0,0], true];
    _off = _o selectionPosition [getText(_cfg >> "muzzlePos"), "memory"];
    _off = _off apply {[_x]};
    deleteVehicle _o;
    _unit setVariable ["offset", _off];
    _unit setVariable ["last_weapon", _w];
    _unit setVariable ["proxy",
    [
        "proxy:\a3\characters_f\proxies\pistol.001",
        "proxy:\a3\characters_f\proxies\weapon.001",
        "proxy:\a3\characters_f\proxies\launcher.001",
        "proxy:\a3\characters_f\proxies\binoculars.001"
    ] select (([1, 4, 4096] find getNumber(_cfg >> "type")) + 1)


    ];
};
_offset = _unit getVariable ["offset", []];
_proxy = _unit getVariable ["proxy", ""];
_unit selectionVectorDirAndUp [_proxy, 1] params ["_vy", "_vz"];
_pos = selectionPosition [_unit, _proxy, 0];

_vx = _vy vectorCrossProduct _vz;

_mat = matrixTranspose [_vx, _vy, _vz];
_pos vectorAdd flatten(_mat matrixMultiply _offset);
