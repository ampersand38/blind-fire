#include "\a3\ui_f\hpp\definedikcodes.inc"
#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {QGVAR(dummy)};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"cba_main"};
        author = "";
        authors[] = {""};
        VERSION_CONFIG;
    };
};

// information on the whole mod (only needed once)
class CfgMods {
    class PREFIX {
        dir = "@BlindFire";
        name = "Blind Fire";

        author = "Ampersand";                    // probably shown somewhere in the mods menu, but probably ignored by CBA/HEMTT

        picture         = "logo_ca.paa";       // Picture displayed from the expansions menu. Optimal size is 2048x1024
        hideName        = "false";              // Hide the extension name in main menu and extension menu
        hidePicture     = "false";              // Hide the extension picture in the extension menu

        action          = "https://github.com/ampersand38/blind-fire"; // Website URL, that can accessed from the expansions menu
        actionName      = "URL";              // label of button/tooltip in extension menu
        description     = "Shoot over and around cover."; // Probably in context with action

        // Color used for DLC stripes and backgrounds (RGBA)
        dlcColor[] =
        {
            1,
            0.0,
            0.86,
            1
        };
    };
};

#include "CfgAmmo.hpp"
#include "CfgDefaultKeysPresets.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgMagazines.hpp"
#include "CfgMovesBasic.hpp"
#include "CfgUserActions.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "UserActionGroups.hpp"
//#include "UserActionsConflictGroups.hpp"
