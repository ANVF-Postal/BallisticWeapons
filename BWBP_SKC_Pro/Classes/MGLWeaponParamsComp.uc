class MGLWeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
    //=================================================================
    // PRIMARY FIRE
    //=================================================================	
	
	Begin Object Class=ProjectileEffectParams Name=ArenaPrimaryEffectParams
		ProjectileClass=Class'BWBP_SKC_Pro.MGLGrenade'
		SpawnOffset=(X=15.000000,Y=10.000000,Z=-9.000000)
		Speed=4500.000000
		Damage=140
		DamageRadius=768.000000
		MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
		Recoil=768.000000
		Chaos=0.650000
		BotRefireRate=0.5
		WarnTargetPct=0.75	
		FireSound=(Sound=Sound'BWBP_SKC_Sounds.MGL.MGL-Fire',Volume=9.200000)
	End Object

	Begin Object Class=FireParams Name=ArenaPrimaryFireParams
		FireInterval=0.850000
		AimedFireAnim="SightFire"	
		FireEffectParams(0)=ProjectileEffectParams'ArenaPrimaryEffectParams'
	End Object
		
    //=================================================================
    // SECONDARY FIRE
    //=================================================================	
	
	Begin Object Class=ProjectileEffectParams Name=ArenaSecondaryEffectParams
		ProjectileClass=Class'BWBP_SKC_Pro.MGLGrenadeRemote'
		SpawnOffset=(X=15.000000,Y=10.000000,Z=-9.000000)
		Speed=4500.000000
		Damage=140
		DamageRadius=768.000000
		MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
		Recoil=768.000000
		Chaos=0.650000
		BotRefireRate=0.300000
		WarnTargetPct=0.300000	
		FireSound=(Sound=Sound'BWBP_SKC_Sounds.MGL.MGL-Fire',Volume=9.200000)
	End Object

	Begin Object Class=FireParams Name=ArenaSecondaryFireParams
		AimedFireAnim="SightFire"	
		FireEffectParams(0)=ProjectileEffectParams'ArenaSecondaryEffectParams'
	End Object

	//=================================================================
	// RECOIL
	//=================================================================

	Begin Object Class=RecoilParams Name=ArenaRecoilParams
		XCurve=(Points=(,(InVal=0.200000,OutVal=-0.100000),(InVal=0.300000,OutVal=-0.200000),(InVal=1.000000,OutVal=-0.300000)))
		YCurve=(Points=(,(InVal=0.300000,OutVal=0.500000),(InVal=1.000000,OutVal=1.000000)))
		YawFactor=0.000000
		XRandFactor=0.400000
		YRandFactor=0.400000
		MaxRecoil=6144.000000
		DeclineDelay=0.500000
	End Object

	//=================================================================
	// AIM
	//=================================================================

	Begin Object Class=AimParams Name=ArenaAimParams
		AimSpread=(Min=64,Max=1024)
		SprintOffset=(Pitch=-2048,Yaw=-2048)
		ChaosDeclineTime=1.000000
        ChaosSpeedThreshold=300
	End Object

	//=================================================================
	// BASIC PARAMS
	//=================================================================	

	Begin Object Class=WeaponParams Name=ArenaParams
		SightPivot=(Pitch=512)
		SightOffset=(X=15.000000,Y=12.450000,Z=14.850000)
		PlayerSpeedFactor=0.95
		InventorySize=8
		SightMoveSpeedFactor=0.8
		SightingTime=0.40000		
		DisplaceDurationMult=1
		MagAmmo=6
		RecoilParams(0)=RecoilParams'ArenaRecoilParams'
        AimParams(0)=AimParams'ArenaAimParams'
		FireParams(0)=FireParams'ArenaPrimaryFireParams'
		AltFireParams(0)=FireParams'ArenaSecondaryFireParams'
    End Object 
    Layouts(0)=WeaponParams'ArenaParams'
	
	//Camos ====================================
	Begin Object Class=WeaponCamo Name=MGL_Desert
		Index=0
		CamoName="Desert"
		Weight=30
	End Object
	
	Begin Object Class=WeaponCamo Name=MGL_Black
		Index=1
		CamoName="Black"
		WeaponMaterialSwaps(0)=(MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,AIndex=-1,PIndex=-1)
		WeaponMaterialSwaps(1)=(MaterialName="BWBP_Camos_Tex.MGLCamos.MGL-MainJungle",Index=1,AIndex=0,PIndex=0)
		Weight=10
	End Object
	
	Begin Object Class=WeaponCamo Name=MGL_Jungle
		Index=2
		CamoName="Jungle"
		WeaponMaterialSwaps(0)=(MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,AIndex=-1,PIndex=-1)
		WeaponMaterialSwaps(1)=(MaterialName="BWBP_Camos_Tex.MGLCamos.MGL-MainJungle",Index=1,AIndex=0,PIndex=0)
		Weight=10
	End Object
	
	Begin Object Class=WeaponCamo Name=MGL_Arctic
		Index=3
		CamoName="Arctic"
		WeaponMaterialSwaps(0)=(MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,AIndex=-1,PIndex=-1)
		WeaponMaterialSwaps(1)=(MaterialName="BWBP_Camos_Tex.MGLCamos.MGL-MainArctic",Index=1,AIndex=0,PIndex=0)
		Weight=10
	End Object
	
	Begin Object Class=WeaponCamo Name=MGL_Purple
		Index=4
		CamoName="Purple"
		WeaponMaterialSwaps(0)=(MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,AIndex=-1,PIndex=-1)
		WeaponMaterialSwaps(1)=(MaterialName="BWBP_Camos_Tex.MGLCamos.MGL-MainPurble",Index=1,AIndex=0,PIndex=0)
		Weight=5
	End Object
	
	Begin Object Class=WeaponCamo Name=MGL_Red
		Index=5
		CamoName="Red"
		WeaponMaterialSwaps(0)=(MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,AIndex=-1,PIndex=-1)
		WeaponMaterialSwaps(1)=(MaterialName="BWBP_Camos_Tex.MGLCamos.MGL-MainRed",Index=1,AIndex=0,PIndex=0)
		Weight=5
	End Object
	
	Begin Object Class=WeaponCamo Name=MGL_Gold
		Index=6
		CamoName="Gold"
		WeaponMaterialSwaps(0)=(MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,AIndex=-1,PIndex=-1)
		WeaponMaterialSwaps(1)=(MaterialName="BWBP_Camos_Tex.MGLCamos.MGL-MainGoldShine",Index=1,AIndex=0,PIndex=0)
		Weight=1
	End Object
	
	Camos(0)=WeaponCamo'MGL_Desert'
	Camos(1)=WeaponCamo'MGL_Black'
	Camos(2)=WeaponCamo'MGL_Jungle'
	Camos(3)=WeaponCamo'MGL_Arctic'
	Camos(4)=WeaponCamo'MGL_Purple'
	Camos(5)=WeaponCamo'MGL_Red'
	Camos(6)=WeaponCamo'MGL_Gold'
}