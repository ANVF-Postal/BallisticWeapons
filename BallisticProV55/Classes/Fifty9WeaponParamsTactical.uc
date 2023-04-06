class Fifty9WeaponParamsTactical extends BallisticWeaponParams;

static simulated function SetAttachmentParams(BallisticAttachment BWA)
{
	BWA.ModeInfos[0].TracerChance = 0;
}

defaultproperties
{    
    //=================================================================
    // PRIMARY FIRE
    //=================================================================	

    Begin Object Class=InstantEffectParams Name=BurstFireEffect
        DecayRange=(Min=525,Max=1225)
        PenetrationEnergy=16
        TraceRange=(Min=3072,Max=3072)
        Damage=26.000000
        HeadMult=2.75f
        LimbMult=0.75f
        RangeAtten=0.5
		Inaccuracy=(X=128,Y=128)
        DamageType=Class'BallisticProV55.DTFifty9SMG'
        DamageTypeHead=Class'BallisticProV55.DTFifty9SMGHead'
        DamageTypeArm=Class'BallisticProV55.DTFifty9SMG'
        PenetrateForce=135
        bPenetrate=True
        MuzzleFlashClass=Class'BallisticProV55.Fifty9FlashEmitter'
        FlashScaleFactor=0.400000
        Recoil=144.000000
        FireSound=(Sound=Sound'BW_Core_WeaponSound.UZI.UZI-Fire',Volume=0.900000)
	    SplashDamage=False
	    RecommendSplashDamage=False
	    BotRefireRate=0.99
        WarnTargetPct=0.2
    End Object

    Begin Object Class=InstantEffectParams Name=AutoFireEffect
        DecayRange=(Min=525,Max=1225)
        PenetrationEnergy=16
        TraceRange=(Min=3072,Max=3072)
        Damage=26.000000
        HeadMult=2.75f
        LimbMult=0.75f
        RangeAtten=0.5
		Inaccuracy=(X=128,Y=128)
        DamageType=Class'BallisticProV55.DTFifty9SMG'
        DamageTypeHead=Class'BallisticProV55.DTFifty9SMGHead'
        DamageTypeArm=Class'BallisticProV55.DTFifty9SMG'
        PenetrateForce=135
        bPenetrate=True
        MuzzleFlashClass=Class'BallisticProV55.Fifty9FlashEmitter'
        FlashScaleFactor=0.400000
        Recoil=144.000000
        FireSound=(Sound=Sound'BW_Core_WeaponSound.UZI.UZI-Fire',Volume=0.900000)
	    SplashDamage=False
	    RecommendSplashDamage=False
	    BotRefireRate=0.99
        WarnTargetPct=0.2
    End Object

    Begin Object Class=FireParams Name=BurstFireParams
        AimedFireAnim="SightFire"
        FireInterval=0.072
        FireEffectParams(0)=InstantEffectParams'BurstFireEffect'
    End Object

    Begin Object Class=FireParams Name=AutoFireParams
        AimedFireAnim="SightFire"
        FireInterval=0.072
        FireEffectParams(0)=InstantEffectParams'AutoFireEffect'
    End Object

    //=================================================================
    // SECONDARY FIRE
    //=================================================================	

    Begin Object Class=MeleeEffectParams Name=MeleeSwipeEffect
        Fatigue=0.090000
        TraceRange=(Min=150.000000,Max=150.000000)
        Damage=45.000000
        DamageType=Class'BallisticProV55.DTFifty9Blade'
        DamageTypeHead=Class'BallisticProV55.DTFifty9BladeHead'
        DamageTypeArm=Class'BallisticProV55.DTFifty9Blade'
        //HookStopFactor=1.700000
        //HookPullForce=100.000000
        FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.UZI.Melee',Volume=0.5,Radius=32.000000,bAtten=True)
        SplashDamage=False
        RecommendSplashDamage=False
        BotRefireRate=0.99
        WarnTargetPct=0.3
    End Object

    Begin Object Class=FireParams Name=MeleeFireParams
        FireAnim="Melee1"
        FireAnimRate=1.5
        FireInterval=0.300000
        AmmoPerFire=0
        FireEffectParams(0)=MeleeEffectParams'MeleeSwipeEffect'
    End Object

	//=================================================================
	// RECOIL
	//=================================================================

	Begin Object Class=RecoilParams Name=TacticalBurstRecoilParams
		XCurve=(Points=(,(InVal=0.200000),(InVal=0.400000,OutVal=0.100000),(InVal=0.600000,OutVal=-0.100000),(InVal=0.800000,OutVal=0.200000),(InVal=1.000000,OutVal=-0.200000)))
		YCurve=(Points=(,(InVal=0.200000,OutVal=0.150000),(InVal=0.400000,OutVal=0.5),(InVal=0.600000,OutVal=0.650000),(InVal=0.800000,OutVal=0.800000),(InVal=1.000000,OutVal=1.000000)))
		XRandFactor=0.1
		YRandFactor=0.1
		DeclineTime=1.1
		ClimbTime=0.04
		MaxRecoil=6144
		CrouchMultiplier=1
		HipMultiplier=1.25
		MaxMoveMultiplier=2
		ViewBindFactor=0.2
		ADSViewBindFactor=0.7 // no stock
		DeclineDelay=0.14
	End Object

	Begin Object Class=RecoilParams Name=TacticalAutoRecoilParams
		XCurve=(Points=(,(InVal=0.200000),(InVal=0.400000,OutVal=0.100000),(InVal=0.600000,OutVal=-0.100000),(InVal=0.800000,OutVal=0.200000),(InVal=1.000000,OutVal=-0.200000)))
		YCurve=(Points=(,(InVal=0.200000,OutVal=0.150000),(InVal=0.400000,OutVal=0.5),(InVal=0.600000,OutVal=0.650000),(InVal=0.800000,OutVal=0.800000),(InVal=1.000000,OutVal=1.000000)))
		XRandFactor=0.1
		YRandFactor=0.1
		ClimbTime=0.04
		DeclineTime=1.1
		MaxRecoil=6144
		CrouchMultiplier=0.85
		HipMultiplier=1.25
		MaxMoveMultiplier=2
		ViewBindFactor=0.2
		ADSViewBindFactor=0.85 // stock
		DeclineDelay=0.14
	End Object

	//=================================================================
	// AIM
	//=================================================================

	Begin Object Class=AimParams Name=TacticalBurstAimParams
        AimSpread=(Min=256,Max=768)
        ADSMultiplier=1
		SprintOffset=(Pitch=-2048,Yaw=-1024)
		AimAdjustTime=0.45000
        ChaosSpeedThreshold=300
	End Object

	Begin Object Class=AimParams Name=TacticalAutoAimParams
        AimSpread=(Min=256,Max=768)
        ADSMultiplier=0.75
		SprintOffset=(Pitch=-2048,Yaw=-1024)
		AimAdjustTime=0.600000
        ChaosSpeedThreshold=300
	End Object

	//=================================================================
	// BASIC PARAMS
	//=================================================================	

    Begin Object Class=WeaponParams Name=TacticalParams
		DisplaceDurationMult=0.5
        MagAmmo=25        
		InventorySize=3
        SightingTime=0.2
        SightMoveSpeedFactor=0.6
		SightPivot=(Pitch=128)
		RecoilParams(0)=RecoilParams'TacticalBurstRecoilParams'
		RecoilParams(1)=RecoilParams'TacticalAutoRecoilParams'
        FireParams(0)=FireParams'BurstFireParams'
        FireParams(1)=FireParams'AutoFireParams'
        AltFireParams(0)=FireParams'MeleeFireParams'
        AimParams(0)=AimParams'TacticalBurstAimParams'
		AimParams(1)=AimParams'TacticalAutoAimParams'
    End Object 
    Layouts(0)=WeaponParams'TacticalParams'
}