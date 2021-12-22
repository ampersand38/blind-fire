#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"
#include "initSettings.sqf";

GVAR(dummy) = objNull;
GVAR(eventHandlers) = [];
GVAR(vectorDirAndUp) = [[0, 1, 0], [0, 0, 1]];

ADDON = true;
