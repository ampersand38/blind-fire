#include "script_component.hpp"
/*
 * Author: Ampersand
 * Handles input Blind Fire (Toggle)
 *
 * Arguments:
 * 0: Direction <NUMBER>
 * 1: Activation <BOOLEAN>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [0, true] call blf_main_fnc_inputAim
 */

params ["_aimDirection", "_activation"];
systemChat format ["%1 %2", diag_frameno, _this];
/*
private _input = if (_activation isEqualType false) then {
    _activation
} else {
    if (_activation isEqualType 0) then {
        _activation > 0
    };
};
*/
false

[{
    params ["_args", "_pfhID"];
    _args params ["_logic", "_gunner", "_target", "_weapon", "_delay", "_dispersion", "_nextBurstTime"];

    if (!alive _logic || {!alive _gunner}) exitWith {
        [_pfhID] call CBA_fnc_removePerFrameHandler;
        deleteVehicle _gunner;
    };

    if (CBA_missionTime >= _nextBurstTime && {allPlayers findIf {_gunner distance _x < 100} == -1}) then {
        private "_targetVector";

        if (_target isNotEqualTo objNull) then {
            // Set vector to target if one is specified
            if (_target isEqualType objNull) then {
                _target = getPosASLVisual _target;
            };

            // Randomize target vector based on dispersion
            _targetVector = getPosASLVisual _logic vectorFromTo _target;
            _targetVector = vectorNormalized (_targetVector vectorAdd [random _dispersion, random _dispersion, random _dispersion]);
            _logic setVectorDirAndUp [_targetVector, _targetVector vectorCrossProduct [-(_targetVector select 1), _targetVector select 0, 0]];
        } else {
            // No specific target, fire randomly in the air
            _gunner setDir random 360;
            [_gunner, 30 + random 60, 0] call BIS_fnc_setPitchBank;
        };

        private _burstLength = 0.1 + random 0.9;

        // Wait until gunner is on-target before starting burst
        [{
            params ["_logic", "_gunner", "_targetVector"];

            !alive _logic
            || {!alive _gunner}
            || {isNil "_targetVector"}
            || {vectorDirVisual _gunner vectorDotProduct _targetVector > 0.95}
        }, {
            params ["_logic", "_gunner", "", "_weapon", "_burstLength", "_startTime"];

            // Exit if aligning to target took too long
            private _timeout = _burstLength - (CBA_missionTime - _startTime);
            if (_timeout <= 0) exitWith {};

            [{
                params ["_logic", "_gunner", "_weapon", "_nextShotTime"];

                if (!alive _logic || {!alive _gunner}) exitWith {
                    true
                };

                if (CBA_missionTime >= _nextShotTime) then {
                    _gunner setAmmo [_weapon, 999];
                    [_gunner, _weapon] call BIS_fnc_fire;

                    private _shotDelay = 0.05 + random 0.1;
                    _this set [3, CBA_missionTime + _shotDelay];
                };

                false
            }, {}, [_logic, _gunner, _weapon, 0], _timeout] call CBA_fnc_waitUntilAndExecute;
        }, [_logic, _gunner, _targetVector, _weapon, _burstLength, CBA_missionTime], _burstLength] call CBA_fnc_waitUntilAndExecute;

        // Ensure a new burst is not started until this one finishes
        _args set [6, CBA_missionTime + (random _delay max _burstLength)];
    };
}, 0.1, [_logic, _gunner, _target, _weapon, _delay, _dispersion, 0]] call CBA_fnc_addPerFrameHandler;
