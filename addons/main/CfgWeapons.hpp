/// All firemodes, to be sure
class Mode_SemiAuto;
class Mode_Burst;
class Mode_FullAuto;

class CfgWeapons {
	class Rifle_Base_F;
	class GVAR(FakeRifle): Rifle_Base_F /// Just basic values common for all testing rifle variants
	{
        author = "Ampersand";
        scope = 2;
        showToPlayer = 0;
		displayName = "Blind Fire"; /// some name
        descriptionShort = "Invisible weapon to hold while blind-firing."; /// displayed on mouseOver in Inventory
		model = QPATHTOF(data\rifle.p3d); /// path to model

		picture = "\a3\ui_f\data\GUI\Cfg\Hints\WeaponResting_ca.paa"; /// different accessories have M, S, T instead of X
		UiPicture = "\A3\Weapons_F\Data\UI\icon_regular_CA.paa"; /// weapon with grenade launcher should be marked such way
		weaponInfoType = "RscWeaponEmpty"; /// display with zeroing is good for iron sights

		muzzles[] = {this}; /// to be able to switch between bullet muzzle and TGL
		magazines[] = {GVAR(1000Rnd_Mag)}; /// original custom made magazines and a group of several standardized mags
		reloadAction = ""; /// MX hand animation actually fits this rifle well
		/// positive value defines speed of the muzzle independent on the magazine setting, negative value is a coefficient of magazine initSpeed
		initSpeed = -1; /// this means that initSpeed of magazine is used

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
			recoil = "recoil_zafir"; /// defined in cfgRecoils
			recoilProne = "assaultRifleBase"; /// defined in cfgRecoils
		};
		class FullAuto: Mode_FullAuto /// Pew-pew-pew-pew-pew
		{
			sounds[] = {};
			reloadTime = 0.096;
			recoil = "recoil_zafir"; /// defined in cfgRecoils
			recoilProne = "assaultRifleBase"; /// defined in cfgRecoils
		};
	};

    class Pistol_Base_F;
    class GVAR(FakePistol): Pistol_Base_F
    {
        author = "Ampersand";
        _generalMacro = QGVAR(FakePistol);
        scope = 2;
        showToPlayer = 0;
		displayName = "Blind Fire"; /// some name
        descriptionShort = "Invisible weapon to hold while blind-firing."; /// displayed on mouseOver in Inventory
		model = QPATHTOF(data\rifle.p3d); /// path to model

		picture = "\a3\ui_f\data\GUI\Cfg\Hints\WeaponResting_ca.paa"; /// different accessories have M, S, T instead of X
		UiPicture = "\A3\Weapons_F\Data\UI\icon_regular_CA.paa"; /// weapon with grenade launcher should be marked such way
		weaponInfoType = "RscWeaponEmpty"; /// display with zeroing is good for iron sights

		muzzles[] = {this}; /// to be able to switch between bullet muzzle and TGL
		magazines[] = {GVAR(1000Rnd_Mag)}; /// original custom made magazines and a group of several standardized mags
		reloadAction = ""; /// MX hand animation actually fits this rifle well
		/// positive value defines speed of the muzzle independent on the magazine setting, negative value is a coefficient of magazine initSpeed
		initSpeed = -1; /// this means that initSpeed of magazine is used
        recoil = "recoil_pistol_zubr";
        drySound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\Zubr\dry_Zubr", 0.398107, 1, 20};
        modes[] = {"Single"};
        class Single: Mode_SemiAuto {
            recoil = "recoil_pistol_heavy";
            recoilProne = "recoil_prone_pistol_heavy";
            sounds[] = {};
        };
        inertia = 0.3;
        dexterity = 1.7;
        maxZeroing = 50;
    };

    class Launcher_Base_F;
	class GVAR(FakeLauncher): Launcher_Base_F
	{
        author = "Ampersand";
        scope = 2;
        showToPlayer = 0;
		displayName = "Blind Fire"; /// some name
        descriptionShort = "Invisible weapon to hold while blind-firing."; /// displayed on mouseOver in Inventory
		model = QPATHTOF(data\launcher.p3d); /// path to model

		picture = "\a3\ui_f\data\GUI\Cfg\Hints\WeaponResting_ca.paa"; /// different accessories have M, S, T instead of X
		UiPicture = "\A3\Weapons_F\Data\UI\icon_at_CA.paa"; /// weapon with grenade launcher should be marked such way
		weaponInfoType = "RscWeaponEmpty"; /// display with zeroing is good for iron sights

		muzzles[] = {this}; /// to be able to switch between bullet muzzle and TGL
        magazines[] = {GVAR(Rocket_Mag)}; /// original custom made magazines and a group of several standardized mags
        reloadAction = ""; /// MX hand animation actually fits this rifle well

        handAnim[] = {"OFP2_ManSkeleton", "\A3\Weapons_F_Exp\Launchers\RPG7\Data\Anim\RPG7V.rtm"};
    	recoil = "recoil_rpg";
    	maxZeroing = 50;
    	inertia = 0.8;
    	aimTransitionSpeed = 0.5;
    	dexterity = 1.2;

    	modes[] = {"Single"};
    	class Single: Mode_SemiAuto
    	{
    		recoil = "recoil_single_law";
            sounds[] = {};
    	};
    	drySound[] = {"A3\Sounds_F\arsenal\weapons\Launchers\RPG32\Dry_RPG32", 0.446684, 1, 20};
	};

};
