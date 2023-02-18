class MARSWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{

	//=================================================================
	// PRIMARY FIRE
	//=================================================================	
	
	Begin Object Class=InstantEffectParams Name=RealisticPrimaryEffectParams
		TraceRange=(Min=1400.000000,Max=6000.000000) /5.56mm
		WaterTraceRange=5000.0
		DecayRange=(Min=0.0,Max=0.0)
		RangeAtten=0.0500000
		Damage=45.0
		HeadMult=2.139534
		LimbMult=0.651162
		DamageType=Class'BWBP_SKC_Pro.DT_MARSAssault'
		DamageTypeHead=Class'BWBP_SKC_Pro.DT_MARSAssaultHead'
		DamageTypeArm=Class'BWBP_SKC_Pro.DT_MARSAssault'
		PenetrationEnergy=16.000000
		PenetrateForce=50
		bPenetrate=True
		PDamageFactor=0.6
		WallPDamageFactor=0.4
		SpreadMode=FSM_Rectangle
		MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
		FlashScaleFactor=1.000000
		FireSound=(Sound=Sound'BWBP_SKC_Sounds.M514H.M514H-Fire',Volume=0.900000,Slot=SLOT_Interact,bNoOverride=False)
		Recoil=725.000000
		Chaos=0.05000
		Inaccuracy=(X=12,Y=12)
		WarnTargetPct=0.200000
	End Object

	Begin Object Class=FireParams Name=RealisticPrimaryFireParams
		FireInterval=0.072000
		BurstFireRateFactor=1.00
		FireEndAnim=
		AimedFireAnim="SightFire"	
		FireAnimRate=1.2000000	
	FireEffectParams(0)=InstantEffectParams'RealisticPrimaryEffectParams'
	End Object
		
    //=================================================================
    // SECONDARY FIRE
    //=================================================================	
	
	Begin Object Class=ProjectileEffectParams Name=RealisticSecondaryEffectParams
		ProjectileClass=Class'BWBP_SKC_Pro.MARSGrenade'
		SpawnOffset=(X=15.000000,Y=10.000000,Z=-9.000000)
		Speed=7000.000000
		MaxSpeed=7000.000000
		Damage=50
		DamageRadius=256.000000
		FireSound=(Sound=Sound'BWBP_SKC_Sounds.LAW.LAW-Fire',Volume=1.200000,Slot=SLOT_Interact,bNoOverride=False)
		Recoil=1024.000000
		Chaos=-1.0
		Inaccuracy=(X=6,Y=6)
		SplashDamage=True
		RecommendSplashDamage=True
		BotRefireRate=0.300000
		WarnTargetPct=0.300000	
	End Object

	Begin Object Class=FireParams Name=RealisticSecondaryFireParams
		FireInterval=2.000000
		BurstFireRateFactor=1.00
		PreFireAnim="GLPrepFire"
		FireAnim="GLFire"
	FireEffectParams(0)=ProjectileEffectParams'ClassicSecondaryEffectParams'
	End Object
		
	//=================================================================
	// RECOIL
	//=================================================================

	Begin Object Class=RecoilParams Name=RealisticRecoilParams_HeavyBarrel
		XCurve=(Points=(,(InVal=0.450000,OutVal=0.40000),(InVal=0.65000,OutVal=0.2000),(InVal=1.0000000,OutVal=0.150000)))
		YCurve=(Points=(,(InVal=0.500000,OutVal=0.350000),(InVal=0.750000,OutVal=0.400000),(InVal=1.000000,OutVal=0.500000)))
		YawFactor=0.15000
		XRandFactor=0.165000
		YRandFactor=0.165000
		MaxRecoil=3000.000000
		DeclineTime=0.850000 //HB
		DeclineDelay=0.150000 //HB
		ViewBindFactor=0.060000
		ADSViewBindFactor=1.000000
		HipMultiplier=1.000000
		CrouchMultiplier=0.700000
		bViewDecline=True
	End Object
	
	Begin Object Class=RecoilParams Name=RealisticRecoilParams
		XCurve=(Points=(,(InVal=0.450000,OutVal=0.40000),(InVal=0.65000,OutVal=0.2000),(InVal=1.0000000,OutVal=0.150000)))
		YCurve=(Points=(,(InVal=0.500000,OutVal=0.350000),(InVal=0.750000,OutVal=0.400000),(InVal=1.000000,OutVal=0.500000)))
		YawFactor=0.15000
		XRandFactor=0.165000
		YRandFactor=0.165000
		MaxRecoil=3000.000000
		DeclineTime=0.750000
		DeclineDelay=0.135000
		ViewBindFactor=0.060000
		ADSViewBindFactor=0.200000
		HipMultiplier=1.000000
		CrouchMultiplier=0.700000
		bViewDecline=True
	End Object

	//=================================================================
	// AIM
	//=================================================================

	Begin Object Class=AimParams Name=RealisticAimParams_HeavyBarrel
		AimSpread=(Min=256,Max=1280) //HB
		CrouchMultiplier=0.700000
		ADSMultiplier=0.700000
		ViewBindFactor=0.060000
		SprintChaos=0.400000
		SprintOffSet=(Pitch=-1000,Yaw=-2048)
		JumpChaos=0.350000
		JumpOffSet=(Pitch=-5000,Yaw=-1000)
		FallingChaos=0.400000
		ChaosDeclineTime=1.200000
		ChaosSpeedThreshold=565.000000
	End Object

	Begin Object Class=AimParams Name=RealisticAimParams
		AimSpread=(Min=400,Max=1280)
		CrouchMultiplier=0.700000
		ADSMultiplier=0.700000
		ViewBindFactor=0.060000
		SprintChaos=0.400000
		SprintOffSet=(Pitch=-1000,Yaw=-2048)
		JumpChaos=0.350000
		JumpOffSet=(Pitch=-5000,Yaw=-1000)
		FallingChaos=0.400000
		ChaosDeclineTime=1.200000
		ChaosSpeedThreshold=565.000000
	End Object
    
	//=================================================================
	// BASIC PARAMS
	//=================================================================	
	
	Begin Object Class=WeaponParams Name=RealisticParams
		InventorySize=12
		SightMoveSpeedFactor=0.500000
		SightingTime=0.3
		SightOffset=(X=-5.000000,Y=-7.340000,Z=27.170000)
		ViewOffset=(X=-6.000000,Y=9.500000,Z=-21.000000)
		ZoomType=ZT_Logarithmic
		MagAmmo=30
		bMagPlusOne=True
		WeaponModes(0)=(ModeName="Semi",ModeID="WM_SemiAuto",Value=1.000000)
		WeaponModes(1)=(ModeName="Burst",ModeID="WM_BigBurst",Value=3.000000,bUnavailable=True)
		WeaponModes(2)=(ModeName="Auto",ModeID="WM_FullAuto")
		InitialWeaponMode=2
		ReloadAnimRate=1.000000
		CockAnimRate=1.000000
		WeaponName="MARS-2 5.56mm Bullpup Rifle"
		RecoilParams(0)=RecoilParams'RealisticRecoilParams_HeavyBarrel'
		AimParams(0)=AimParams'RealisticAimParams_HeavyBarrel'
		FireParams(0)=FireParams'RealisticPrimaryFireParams'
		AltFireParams(0)=FireParams'RealisticSecondaryFireParams'
	End Object
	Layouts(0)=WeaponParams'RealisticParams'


}