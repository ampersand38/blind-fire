#include "script_component.hpp"

if (hasInterface) then {
    addUserActionEventHandler ["ReloadMagazine", "Activate", {
    	if (!isNull GVAR(dummy)) exitWith {deleteVehicle GVAR(dummy)};
    }];
    addUserActionEventHandler ["gear", "Activate", {
    	if (!isNull GVAR(dummy)) exitWith {deleteVehicle GVAR(dummy)};
    }];
};
