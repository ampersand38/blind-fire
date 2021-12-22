class CfgUserActions
{
    class GVAR(ToggleBlindFire) // This class name is used for internal representation and also for the inputAction command.
    {
        displayName = CSTRING(BlindFireToggle);
        tooltip = CSTRING(BlindFireToggle_Tip);
        onActivate = QUOTE(call FUNC(inputToggleBlindFire));		// _this is always true.
        onDeactivate = QUOTE(call FUNC(inputToggleBlindFire));		// _this is always false.
        onAnalog = QUOTE(call FUNC(inputToggleBlindFire));	// _this is the scalar analog value.
        analogChangeThreshold = 0.1; // Minimum change required to trigger the onAnalog EH (default: 0.01).
    };
};
