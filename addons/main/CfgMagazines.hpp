class CfgMagazines
{
	class Default;

	class CA_Magazine;

	class GVAR(1000Rnd_Mag): CA_Magazine
	{
		scope = 1; /// or 2, to be precise
		displayName = "Blind Fire";
		picture = "\A3\Weapons_F\Data\placeholder_co.paa"; /// just some icon
		ammo = FakeAmmo;
		count = 1000; /// 30 rounds is enough
		initSpeed = 0; /// standard muzzle speed
		tracersEvery = 0; /// disable tracers by default
		lastRoundsTracer = 0; /// tracers to track low ammo
		descriptionShort = ""; /// on mouse-over in Inventory
		magazineGroup[]	= {QGVAR(magazineGroup)}; /// all magazines in the same group may be used in weapon that has the group defined as compatible
	};
};