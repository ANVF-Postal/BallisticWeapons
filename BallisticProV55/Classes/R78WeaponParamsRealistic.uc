class R78WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{

	//=================================================================
	// PRIMARY FIRE
	//=================================================================	
	
	Begin Object Class=InstantEffectParams Name=RealisticPrimaryEffectParams
		TraceRange=(Min=3000.000000,Max=15000.000000)
		WaterTraceRange=12000.0
		DecayRange=(Min=0.0,Max=0.0)
		RangeAtten=0.1
		Damage=146.0
		HeadMult=2.123287
		LimbMult=0.630136
		DamageType=Class'BallisticProV55.DTR78Rifle'
		DamageTypeHead=Class'BallisticProV55.DTR78RifleHead'
		DamageTypeArm=Class'BallisticProV55.DTR78Rifle'
		PenetrationEnergy=30.000000
		PenetrateForce=350
		bPenetrate=True
		PDamageFactor=0.6
		WallPDamageFactor=0.4
		SpreadMode=FSM_Rectangle
		MuzzleFlashClass=Class'BallisticProV55.R78FlashEmitter'
		FireSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78-Fire',Pitch=1.000000,Volume=1.200000)
		Recoil=1792.000000
		Chaos=0.800000
		Inaccuracy=(X=1,Y=1)
		BotRefireRate=0.250000
		WarnTargetPct=0.050000
	End Object

	Begin Object Class=FireParams Name=RealisticPrimaryFireParams
		FireInterval=0.400000
		BurstFireRateFactor=1.00
		bCockAfterFire=True
		FireEndAnim=
		FireAnimRate=0.7500000	
	FireEffectParams(0)=InstantEffectParams'RealisticPrimaryEffectParams'
	End Object

	//=================================================================
    // SECONDARY FIRE
    //=================================================================	

	Begin Object Class=FireEffectParams Name=RealisticSecondaryEffectParams
		BotRefireRate=0.300000
	End Object
	
	Begin Object Class=FireParams Name=RealisticSecondaryFireParams
		FireInterval=0.200000
		AmmoPerFire=0
		FireEffectParams(0)=FireEffectParams'RealisticSecondaryEffectParams'
	End Object
	
	//=================================================================
	// RECOIL
	//=================================================================

	Begin Object Class=RecoilParams Name=RealisticRecoilParams
		XCurve=(Points=(,(InVal=1.000000,OutVal=1.000000)))
		YawFactor=0.000000
		XRandFactor=0.300000
		YRandFactor=0.300000
		MaxRecoil=1792.000000
		DeclineTime=0.500000
		DeclineDelay=0.500000
		ViewBindFactor=0.500000
		ADSViewBindFactor=0.500000
		HipMultiplier=1.000000
		CrouchMultiplier=0.700000
		bViewDecline=True
	End Object

	//=================================================================
	// AIM
	//=================================================================

	Begin Object Class=AimParams Name=RealisticAimParams
		AimSpread=(Min=680,Max=1792)
		AimAdjustTime=0.350000
		CrouchMultiplier=0.700000
		ADSMultiplier=0.700000
		ViewBindFactor=0.050000
		SprintChaos=0.400000
		ChaosDeclineTime=0.750000
		ChaosSpeedThreshold=575.000000
	End Object
    
	//=================================================================
	// BASIC PARAMS
	//=================================================================	
	
	Begin Object Class=WeaponParams Name=RealisticParams
		InventorySize=35
		SightMoveSpeedFactor=0.500000
		SightingTime=0.300000
		MagAmmo=5
        ZoomType=ZT_Logarithmic
		ViewOffset=(X=1.000000,Y=6.500000,Z=-12.000000)
		SightOffset=(X=10.500000,Y=0.000000,Z=17.0500000)
		ReloadAnimRate=1.000000
		CockAnimRate=1.250000
		WeaponBoneScales(0)=(BoneName="Silencer",Slot=78,Scale=0f)
		RecoilParams(0)=RecoilParams'RealisticRecoilParams'
		AimParams(0)=AimParams'RealisticAimParams'
		FireParams(0)=FireParams'RealisticPrimaryFireParams'
		AltFireParams(0)=FireParams'RealisticSecondaryFireParams'
	End Object
	Layouts(0)=WeaponParams'RealisticParams'


}