class M763WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
    //=================================================================
    // PRIMARY FIRE
    //=================================================================	
	
	Begin Object Class=ShotgunEffectParams Name=ArenaPrimaryEffectParams
		TraceRange=(Min=3072.000000,Max=3072.000000)
        DecayRange=(Min=1250,Max=3000)
		RangeAtten=0.15
		TraceCount=10
		TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
		ImpactManager=Class'BallisticProV55.IM_Shell'
		Damage=10
		DamageType=Class'BallisticProV55.DTM763Shotgun'
		DamageTypeHead=Class'BallisticProV55.DTM763ShotgunHead'
		DamageTypeArm=Class'BallisticProV55.DTM763Shotgun'
		MuzzleFlashClass=Class'BallisticProV55.M763FlashEmitter'
		FlashScaleFactor=1.000000
		Recoil=768.000000
		Chaos=0.30000
		BotRefireRate=0.7
		WarnTargetPct=0.5
		Inaccuracy=(X=200,Y=200)
		FireSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Fire1',Volume=1.300000)
	End Object

	Begin Object Class=FireParams Name=ArenaPrimaryFireParams
		FireInterval=0.85
		FireAnim="FireCombined"
		FireEndAnim=
		AimedFireAnim="FireCombinedSight"
		bCockAfterFire=True
		FireAnimRate=0.9	
		FireEffectParams(0)=ShotgunEffectParams'ArenaPrimaryEffectParams'
	End Object
		
    //=================================================================
    // SECONDARY FIRE
    //=================================================================	

	Begin Object Class=InstantEffectParams Name=ArenaSecondaryEffectParams
		TraceRange=(Min=768.000000,Max=768.000000)
		RangeAtten=0.25
		Damage=35
		DamageType=Class'BallisticProV55.DTM763Shotgun'
		DamageTypeHead=Class'BallisticProV55.DTM763ShotgunHead'
		DamageTypeArm=Class'BallisticProV55.DTM763Shotgun'
		PenetrateForce=100
		bPenetrate=True
		FlashScaleFactor=2.000000
		Recoil=1280.000000
		Chaos=0.500000
		BotRefireRate=0.3
		WarnTargetPct=0.75
		FireSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Fire1',Volume=1.300000)
	End Object

	Begin Object Class=FireParams Name=ArenaSecondaryFireParams
		TargetState="GasSpray"
		FireInterval=0.750000
		FireAnim="FireCombined"
		FireEndAnim=
		AimedFireAnim="FireCombinedSight"
		FireAnimRate=1.100000	
		FireEffectParams(0)=InstantEffectParams'ArenaSecondaryEffectParams'
	End Object
		
	//=================================================================
	// RECOIL
	//=================================================================

	Begin Object Class=RecoilParams Name=ArenaRecoilParams
		ViewBindFactor=0.25
		XCurve=(Points=(,(InVal=0.200000,OutVal=0.10000),(InVal=0.350000,OutVal=0.13000),(InVal=0.550000,OutVal=0.230000),(InVal=0.800000,OutVal=0.35000),(InVal=1.000000,OutVal=0.45)))
		YCurve=(Points=(,(InVal=0.150000,OutVal=0.150000),(InVal=0.40000,OutVal=0.50000),(InVal=0.600000,OutVal=0.700000),(InVal=1.000000,OutVal=1.000000)))
		XRandFactor=0.100000
		YRandFactor=0.100000
		DeclineTime=0.500000
		DeclineDelay=0.75
	End Object

	//=================================================================
	// AIM
	//=================================================================

	Begin Object Class=AimParams Name=ArenaAimParams
		ADSMultiplier=0.5
		SprintOffset=(Pitch=-2048,Yaw=-2048)
		AimSpread=(Min=16,Max=128)
        ChaosSpeedThreshold=300
		ChaosDeclineTime=0.750000
	End Object

	//=================================================================
	// BASIC PARAMS
	//=================================================================	

	Begin Object Class=WeaponParams Name=ArenaParams
		CockAnimRate=1.100000
		ReloadAnimRate=1.100000
		MagAmmo=6
        SightingTime=0.350000
		SightMoveSpeedFactor=0.8
		SightPivot=(Pitch=128)
        InventorySize=5
        RecoilParams(0)=RecoilParams'ArenaRecoilParams'
        AimParams(0)=AimParams'ArenaAimParams'
		FireParams(0)=FireParams'ArenaPrimaryFireParams'
		AltFireParams(0)=FireParams'ArenaSecondaryFireParams'
    End Object 
    Layouts(0)=WeaponParams'ArenaParams'
	
	//Camos =====================================
	Begin Object Class=WeaponCamo Name=M763_Gray
		Index=0
		CamoName="Gray"
		Weight=30
	End Object
	
	Begin Object Class=WeaponCamo Name=M763_OD
		Index=1
		CamoName="Olive Drab"
		WeaponMaterialSwaps(0)=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',Index=0,AIndex=-1,PIndex=-1)
		WeaponMaterialSwaps(1)=(MaterialName="BWBP_Camos_Tex.M763Camos.M763-KShotgunShiney",Index=1,AIndex=1,PIndex=0)
		WeaponMaterialSwaps(2)=(MaterialName="BWBP_Camos_Tex.M763Camos.M763-KSmallShiney",Index=2,AIndex=0,PIndex=1)
		Weight=15
	End Object
	
	Begin Object Class=WeaponCamo Name=M763_Wood
		Index=2
		CamoName="Wood"
		WeaponMaterialSwaps(0)=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',Index=0,AIndex=-1,PIndex=-1)
		WeaponMaterialSwaps(1)=(MaterialName="BWBP_Camos_Tex.M763Camos.M781_LargeShine",Index=1,AIndex=1,PIndex=0)
		WeaponMaterialSwaps(2)=(MaterialName="BWBP_Camos_Tex.M763Camos.M781_SmallShine",Index=2,AIndex=0,PIndex=1)
		Weight=10
	End Object
	
	Begin Object Class=WeaponCamo Name=M763_Trusty
		Index=3
		CamoName="Ol' Trusty"
		WeaponMaterialSwaps(0)=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',Index=0,AIndex=-1,PIndex=-1)
		WeaponMaterialSwaps(1)=(MaterialName="BWBP_Camos_Tex.M763Camos.M781-OldTrusty",Index=1,AIndex=1,PIndex=0)
		WeaponMaterialSwaps(2)=(MaterialName="BWBP_Camos_Tex.M763Camos.M781Small",Index=2,AIndex=0,PIndex=1)
		Weight=3
	End Object
	
	Camos(0)=WeaponCamo'M763_Gray'
	Camos(1)=WeaponCamo'M763_OD'
	Camos(2)=WeaponCamo'M763_Wood'
	Camos(3)=WeaponCamo'M763_Trusty'
}