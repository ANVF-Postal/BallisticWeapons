class WrenchWeaponParams extends BallisticWeaponParams;

defaultproperties
{    
    Begin Object Class=RecoilParams Name=UniversalRecoilParams
        ViewBindFactor=0.00
        PitchFactor=0
        YawFactor=0
        DeclineTime=1.500000
    End Object

    Begin Object Class=AimParams Name=UniversalAimParams
        ViewBindFactor=0.00
        SprintOffset=(Pitch=-3000,Yaw=-4000)
        AimSpread=(Min=0,Max=0)
        ChaosDeclineTime=0.320000
    End Object

    Begin Object Class=WeaponParams Name=UniversalParams
        PlayerSpeedFactor=0.65
        PlayerJumpFactor=0.65
        MagAmmo=1
        InventorySize=12
        RecoilParams(0)=RecoilParams'UniversalRecoilParams'
        AimParams(0)=AimParams'UniversalAimParams'
    End Object 
    Params(0)=WeaponParams'UniversalParams'
}