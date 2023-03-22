class CX85WeaponParamsTactical extends BallisticWeaponParams;

static simulated function SetAttachmentParams(BallisticAttachment BWA)
{
	BWA.ModeInfos[0].TracerChance = 1;
	BWA.ModeInfos[0].TracerMix = 5;
}

defaultproperties
{
	
	//=================================================================
    // PRIMARY FIRE
    //=================================================================	
	
	Begin Object Class=InstantEffectParams Name=TacticalPrimaryEffectParams
		TraceRange=(Min=30000.000000,Max=30000.000000)
        DecayRange=(Min=2363,Max=5000)
		RangeAtten=0.67
		Damage=34
        HeadMult=2.75
        LimbMult=0.67f
		DamageType=Class'BWBP_OP_Pro.DTCX85Bullet'
		DamageTypeHead=Class'BWBP_OP_Pro.DTCX85BulletHead'
		DamageTypeArm=Class'BWBP_OP_Pro.DTCX85Bullet'
        PenetrationEnergy=32
		PenetrateForce=150
		bPenetrate=True
		MuzzleFlashClass=class'BallisticProV55.M50FlashEmitter'
		FlashScaleFactor=0.800000
		Recoil=120
		Chaos=0.08
		WarnTargetPct=0.200000
		FireSound=(Sound=Sound'BW_Core_WeaponSound.SAR.SAR-Fire',Volume=0.900000,Slot=SLOT_Interact,Pitch=1.500000,bNoOverride=False)
	End Object

	Begin Object Class=FireParams Name=TacticalPrimaryFireParams
		FireInterval=0.0900000
		FireAnim="Fire"
		FireEndAnim=
		AimedFireAnim="Fire"
		FireAnimRate=1.200000
		FireEffectParams(0)=InstantEffectParams'TacticalPrimaryEffectParams'
	End Object
	
	//=================================================================
    // SECONDARY FIRE
    //=================================================================	
	
	Begin Object Class=InstantEffectParams Name=TacticalSecondaryEffectParams
		TraceRange=(Min=30000.000000,Max=30000.000000)
		Damage=5
		DamageType=Class'DTCX85Dart'
		DamageTypeHead=Class'DTCX85Dart'
		DamageTypeArm=Class'DTCX85Dart'
		FireSound=(Sound=Sound'BW_Core_WeaponSound.OA-SMG.OA-SMG_FireDart',Volume=1.350000)
		Recoil=256.000000
		Chaos=0.5
		BotRefireRate=0.300000
		WarnTargetPct=0.300000
	End Object

	Begin Object Class=FireParams Name=TacticalSecondaryFireParams
		FireInterval=0.350000
		AmmoPerFire=0
		PreFireAnim=
		FireAnim="FireAlt"	
	FireEffectParams(0)=InstantEffectParams'TacticalSecondaryEffectParams'
	End Object
	
	//=================================================================
	// RECOIL
	//=================================================================
	
	Begin Object Class=RecoilParams Name=TacticalRecoilParams
		ViewBindFactor=0.3
		XCurve=(Points=(,(InVal=0.100000),(InVal=0.250000,OutVal=0.120000),(InVal=0.400000,OutVal=0.180000),(InVal=0.800000,OutVal=0.220000),(InVal=1.000000,OutVal=0.250000)))
		YCurve=(Points=(,(InVal=0.150000,OutVal=0.120000),(InVal=0.300000,OutVal=0.350000),(InVal=0.5,OutVal=0.445000),(InVal=0.750000,OutVal=0.750000),(InVal=1.000000,OutVal=1.000000)))
		XRandFactor=0.05000
		YRandFactor=0.05000
		DeclineTime=1.000000
		DeclineDelay=0.170000
		HipMultiplier=1.25
		MaxMoveMultiplier=2
	End Object

	//=================================================================
	// AIM
	//=================================================================
	
	Begin Object Class=AimParams Name=TacticalAimParams
		AimSpread=(Min=512,Max=2048)
		ADSMultiplier=0.5
		SprintOffset=(Pitch=-3072,Yaw=-4096)
		JumpOffset=(Pitch=-1024,Yaw=-1024)
        ChaosSpeedThreshold=300
	End Object

	//=================================================================
	// BASIC PARAMS
	//=================================================================	
	
	Begin Object Class=WeaponParams Name=TacticalParams
		ViewOffset=(X=25.000000,Y=18.000000,Z=-25.000000)
		SightOffset=(X=-20.000000,Z=35.000000)
		CockAnimRate=1.200000
		ReloadAnimRate=0.85
		PlayerSpeedFactor=0.95
		InventorySize=6
		SightMoveSpeedFactor=0.35
		SightingTime=0.65
		DisplaceDurationMult=1
		MagAmmo=50
        // sniper 4-8x
		ZoomType=ZT_Logarithmic
		MinZoom=4
		MaxZoom=8
		ZoomStages=1
        RecoilParams(0)=RecoilParams'TacticalRecoilParams'
        AimParams(0)=AimParams'TacticalAimParams'
		FireParams(0)=FireParams'TacticalPrimaryFireParams'
		AltFireParams(0)=FireParams'TacticalSecondaryFireParams'
    End Object 
    Layouts(0)=WeaponParams'TacticalParams'
}