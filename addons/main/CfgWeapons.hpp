/// All firemodes, to be sure
class Mode_SemiAuto;
class Mode_Burst;
class Mode_FullAuto;

class CfgWeapons {
	class Rifle;
	class Rifle_Base_F: Rifle
	{
		class WeaponSlotsInfo;
		class GunParticles;
	};

	class GVAR(FakeRifleBase): Rifle_Base_F /// Just basic values common for all testing rifle variants
	{
		magazines[] = {GVAR(1000Rnd_Mag), GVAR(magazineGroup)}; /// original custom made magazines and a group of several standardized mags
		reloadAction = "GestureReloadMX"; /// MX hand animation actually fits this rifle well
		magazineReloadSwitchPhase = 0.4; /// part of reload animation when new magazine ammo count should affect "revolving" animation source
		discreteDistanceInitIndex = 0; /// Ironsight zeroing is the lowest value by default

		// Size of recoil sway of the cursor
		maxRecoilSway=0.0125;
        // Speed at which the recoil sway goes back to zero (from maxRecoilSway to 0 in 1/swayDecaySpeed seconds)
        swayDecaySpeed=1.25;
		/// inertia coefficient of the weapon
		inertia = 0.5;

		/// positive value defines speed of the muzzle independent on the magazine setting, negative value is a coefficient of magazine initSpeed
		initSpeed = -1; /// this means that initSpeed of magazine is used

		class GunParticles : GunParticles {};

		class WeaponSlotsInfo: WeaponSlotsInfo {};

/////////////////////////////////////////////////////  I R O N S I G H T S  /////////////////////////////////////////////////////
		opticsZoomMin=0.375;
		opticsZoomMax=1.1;
		opticsZoomInit=0.75;

		distanceZoomMin = 50;
		distanceZoomMax = 50;
/////////////////////////////////////////////////////  I R O N S I G H T S  /////////////////////////////////////////////////////

		descriptionShort = "Invisible weapon to hold while blind-firing."; /// displayed on mouseOver in Inventory
		handAnim[] = {"OFP2_ManSkeleton", "\A3\Weapons_F\Rifles\MX\data\Anim\MX_gl.rtm"}; /// MX hand animation actually fits this rifle well
		dexterity = 1.8;

//caseless ammo//
		caseless[] = {"",1,1,1};  /// no sound of ejected brass
		soundBullet[] = {caseless,1};

		selectionFireAnim = ""; /// are we able to get rid of all the zaslehs?

		modes[] = {Single, FullAuto}; /// Includes fire modes for AI

    ////////////////////////////////////////////////////// NO OPTICS ///////////////////////////////////////////////////////////

		class Single: Mode_SemiAuto /// Pew
		{
			// the new parameter to distinguish muzzle accessories type
			sounds[] = {};

			reloadTime = 0.096; /// means some 625 rounds per minute
			dispersion = 0.00087; /// A bit less than 3 MOA

			recoil = "recoil_single_Test_rifle_01"; /// defined in cfgRecoils
			recoilProne = "recoil_single_prone_Test_rifle_01"; /// defined in cfgRecoils

			minRange = 2; minRangeProbab = 0.5; 	/// Task Force Balance black magic - this is the probability which AI thinks it would hit target at set range with
			midRange = 200; midRangeProbab = 0.7; 	/// it is no real probability of hit, just used for AI to compute if the shot is worth to take - AI chooses highest
			maxRange = 400; maxRangeProbab = 0.3; 	/// probability of the weapon, does some calculation and compares it with calculated probability of other weapons
		};

		class FullAuto: Mode_FullAuto /// Pew-pew-pew-pew-pew
		{
			sounds[] = {};

			reloadTime = 0.096;
			dispersion = 0.00087;

			recoil = "recoil_auto_Test_rifle_01"; /// defined in cfgRecoils
			recoilProne = "recoil_auto_prone_Test_rifle_01"; /// defined in cfgRecoils

			minRange = 0; minRangeProbab = 0.9;
			midRange = 15; midRangeProbab = 0.7;
			maxRange = 30; maxRangeProbab = 0.1;

			aiRateOfFire = 0.000001;
		};

		aiDispersionCoefY=6.0; /// AI should have some degree of greater dispersion for initial shoots
		aiDispersionCoefX=4.0; /// AI should have some degree of greater dispersion for initial shoots
		drySound[]={"A3\sounds_f\weapons\Other\dry_1", db-5, 1, 10}; /// custom made sounds
		reloadMagazineSound[]={"A3\sounds_f\weapons\reloads\new_MX",db-8,1, 30}; /// custom made sounds
	};

	class GVAR(FakeRifle): GVAR(FakeRifleBase)
	{
        scope = 2;
		displayName = "Blind Fire"; /// some name
		model = QPATHTOF(data\rifle.p3d); /// path to model

		picture = "\a3\ui_f\data\GUI\Cfg\Hints\WeaponResting_ca.paa"; /// different accessories have M, S, T instead of X
		UiPicture = "\A3\Weapons_F\Data\UI\icon_regular_CA.paa"; /// weapon with grenade launcher should be marked such way

		weaponInfoType = "RscWeaponEmpty"; /// display with zeroing is good for iron sights

		muzzles[] = {this}; /// to be able to switch between bullet muzzle and TGL

		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			mass = 100; /// some rough estimate
		};
	};
};
