class UserActionGroups
{
	class GVAR(BlindFire) // Unique classname of your category.
	{
		name = CSTRING(BlindFire); // Display name of your category.
		isAddon = 1;
		group[] = { // List of all actions inside this category.
            QGVAR(ToggleBlindFire)
        };
	};
};
