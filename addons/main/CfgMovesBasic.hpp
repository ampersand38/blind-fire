class CfgMovesBasic
{
	class ManActions
	{
		GVAR(Ges_Right)[]=
		{
			QGVAR(Ges_Right),
			"Gesture"
		};
		GVAR(Ges_Left)[]=
		{
			QGVAR(Ges_Left),
			"Gesture"
		};
		GVAR(Ges_Up)[]=
		{
			QGVAR(Ges_Up),
			"Gesture"
		};
	};
};
class CfgGesturesMale
{
	class Default;
	class States
	{
		class GVAR(Ges_Right): Default
		{
			looped=1;
			speed=1e+010;
			connectTo[]={};
			interpolateTo[]={};
			aiming="empty";
			head="empty";
			canReload=1;
			canPullTrigger=0;
			disableWeapons=0;
			disableWeaponsLong=0;
			weaponLowered=1;
			file=QPATHTOF(data\Left.rtm);
			mask=QGVAR(RightArmTweaked);
			weaponIK=0;
			rightHandIKCurve[]={0};
			leftHandIKCurve[]={0};
		};
		class GVAR(Ges_Left): Default
		{
			looped=1;
			speed=1e+010;
			connectTo[]={};
			interpolateTo[]={};
			aiming="empty";
			head="empty";
			canReload=1;
			canPullTrigger=1;
			disableWeapons=0;
			disableWeaponsLong=0;
			weaponLowered=1;
			file=QPATHTOF(data\Right.rtm);
			mask=QGVAR(WpnOnly);
			weaponIK=1;
			rightHandIKCurve[]={1};
			leftHandIKCurve[]={1};
		};
		class GVAR(Ges_Up): Default
		{
			looped=1;
			speed=1e+010;
			connectTo[]={};
			interpolateTo[]={};
			aiming="empty";
			head="empty";
			canReload=1;
			canPullTrigger=1;
			disableWeapons=0;
			disableWeaponsLong=0;
			weaponLowered=1;
			file=QPATHTOF(data\Up.rtm);
			mask=QGVAR(WpnOnly);
			weaponIK=1;
			rightHandIKCurve[]={1};
			leftHandIKCurve[]={1};
		};
	};
	class BlendAnims
	{
		GVAR(WpnOnly)[]=
		{
			"weapon",
			1
		};
		GVAR(RightArmTweaked)[]=
		{
			"RightShoulder",
			1,
			"RightArm",
			1,
			"RightArmRoll",
			1,
			"RightForeArm",
			1,
			"RightForeArmRoll",
			1,
			"RightHand",
			1,
			"RightHandRing",
			1,
			"RightHandPinky1",
			1,
			"RightHandPinky2",
			1,
			"RightHandPinky3",
			1,
			"RightHandRing1",
			1,
			"RightHandRing2",
			1,
			"RightHandRing3",
			1,
			"RightHandMiddle1",
			1,
			"RightHandMiddle2",
			1,
			"RightHandMiddle3",
			1,
			"RightHandIndex1",
			1,
			"RightHandIndex2",
			1,
			"RightHandIndex3",
			1,
			"RightHandThumb1",
			1,
			"RightHandThumb2",
			1,
			"RightHandThumb3",
			1,
			"weapon",
			1,
			"LeftShoulder",
			1,
			"LeftArm",
			1,
			"LeftArmRoll",
			1,
			"LeftForeArm",
			1,
			"LeftForeArmRoll",
			1,
			"LeftHand",
			1,
			"LeftHandRing",
			1,
			"LeftHandPinky1",
			1,
			"LeftHandPinky2",
			1,
			"LeftHandPinky3",
			1,
			"LeftHandRing1",
			1,
			"LeftHandRing2",
			1,
			"LeftHandRing3",
			1,
			"LeftHandMiddle1",
			1,
			"LeftHandMiddle2",
			1,
			"LeftHandMiddle3",
			1,
			"LeftHandIndex1",
			1,
			"LeftHandIndex2",
			1,
			"LeftHandIndex3",
			1,
			"LeftHandThumb1",
			1,
			"LeftHandThumb2",
			1,
			"LeftHandThumb3",
			1
		};

	};
};
