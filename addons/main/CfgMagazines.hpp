class CfgMagazines {
	class Default;
	class CA_Magazine;

	class GVAR(1000Rnd_Mag): CA_Magazine {
    	author = "Ampersand";
		scope = 1; /// or 2, to be precise
		displayName = "Blind Fire";
		picture = "\A3\Weapons_F\Data\placeholder_co.paa"; /// just some icon
		ammo = QGVAR(FakeAmmo);
		count = 1000; /// 30 rounds is enough
		initSpeed = 0; /// standard muzzle speed
		tracersEvery = 0; /// disable tracers by default
		lastRoundsTracer = 0; /// tracers to track low ammo
		descriptionShort = ""; /// on mouse-over in Inventory
		magazineGroup[]	= {QGVAR(magazineGroup)}; /// all magazines in the same group may be used in weapon that has the group defined as compatible
	};

    class RPG7_F;
    class GVAR(Rocket_Mag): RPG7_F {
    	author = "Ampersand";
    	scope = 1;
    	displayName = "Blind Fire";
    	model = "";
    	modelSpecial = "";
        initSpeed = 0;
    	displaynameshort = "AT";
    	ammo = QGVAR(FakeAmmo);
    	type = "2*		256";
    };

};
