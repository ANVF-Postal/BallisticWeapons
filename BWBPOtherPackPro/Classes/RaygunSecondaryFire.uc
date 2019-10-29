//=============================================================================
// Raygun Secondary Fire.
//
// Either a conventional charged shot or an irradiating shot.
//=============================================================================
class RaygunSecondaryFire extends BallisticProProjectileFire;

var() Sound	ChargeSound;
var()	byte		ChargeSoundPitch;
var() float		ChargeTime, DecayCharge;

simulated function bool AllowFire()
{
	if (Raygun(BW).bShieldOn)
		return false;
	if (Raygun(BW).bLockSecondary)
		return false;
	return Super.AllowFire();
}

simulated function vector GetFireSpread()
{
	local float fX;
	local Rotator R;

	if (BW.bScopeView)
		return super.GetFireSpread();
	else
	{
		fX = frand();
		R.Yaw =  1536 * sin ((frand()*2-1) * 1.5707963267948966) * sin(fX*1.5707963267948966);
		R.Pitch = 1536 * sin ((frand()*2-1) * 1.5707963267948966) * cos(fX*1.5707963267948966);
		return Vector(R);
	}
}

simulated function PlayStartHold()
{
	HoldTime = FMax(DecayCharge,0.1);
	
	Weapon.AmbientSound = ChargeSound;
	Weapon.ThirdPersonActor.AmbientSound = ChargeSound;
	
	Weapon.SoundVolume = 48 + FMin(ChargeTime, HoldTime)/ChargeTime * 128;
	Weapon.SoundPitch = ChargeSoundPitch + FMin(ChargeTime, HoldTime)/ChargeTime * ChargeSoundPitch;
	
	Weapon.ThirdPersonActor.SoundVolume = 48 + FMin(ChargeTime, HoldTime)/ChargeTime * 128;
	Weapon.ThirdPersonActor.SoundPitch = ChargeSoundPitch + FMin(ChargeTime, HoldTime)/ChargeTime * ChargeSoundPitch;
	//Abuse Channel 1 to dampen the animation if required.
	Raygun(BW).BlendFireHold();
	BW.bPreventReload=True;
	BW.SafeLoopAnim('ChargeLoop', 1.0, TweenTime, ,"IDLE");
}

simulated function ModeTick(float DeltaTime)
{
	Super.ModeTick(DeltaTime);
	
	if (bIsFiring)
	{
		Weapon.ThirdPersonActor.SoundVolume = 48 + FMin(ChargeTime, HoldTime)/ChargeTime * 128;
		Weapon.ThirdPersonActor.SoundPitch = ChargeSoundPitch + FMin(ChargeTime, HoldTime)/ChargeTime * ChargeSoundPitch;
		
		Weapon.SoundVolume = 48 + FMin(ChargeTime, HoldTime)/ChargeTime * 128;
		Weapon.SoundPitch = ChargeSoundPitch + FMin(ChargeTime, HoldTime)/ChargeTime * ChargeSoundPitch;
	}
	else if (DecayCharge > 0)
	{
		Weapon.ThirdPersonActor.SoundVolume = 48 + FMin(ChargeTime, DecayCharge)/ChargeTime * 128;
		Weapon.ThirdPersonActor.SoundPitch = ChargeSoundPitch + FMin(ChargeTime, DecayCharge)/ChargeTime * ChargeSoundPitch;
		
		Weapon.SoundVolume = 48 + FMin(ChargeTime, DecayCharge)/ChargeTime * 128;
		Weapon.SoundPitch = ChargeSoundPitch + FMin(ChargeTime, DecayCharge)/ChargeTime * ChargeSoundPitch;
		DecayCharge -= DeltaTime * 2.5;
		
		if (DecayCharge < 0)
		{
			DecayCharge = 0;
			Weapon.ThirdPersonActor.AmbientSound = None;
			Weapon.AmbientSound = None;
		}
	}
}	

simulated event ModeDoFire()
{
	if (HoldTime >= ChargeTime || (Level.NetMode == NM_DedicatedServer && HoldTime >= ChargeTime - 0.1))
	{
		super.ModeDoFire();
		Raygun(BW).PassDelay(FireRate);
		Weapon.ThirdPersonActor.AmbientSound = None;
		Weapon.AmbientSound = None;
		DecayCharge = 0;
	}
	else
	{
		DecayCharge = FMin(ChargeTime, HoldTime);
		NextFireTime = Level.TimeSeconds + (DecayCharge * 0.35);
		//Blend out channel 1 manually, which we're using to dampen the charge animation.
		BW.AnimBlendParams(1, 0);
	}
		
	HoldTime = 0;
}

defaultproperties
{
     ChargeSound=Sound'IndoorAmbience.machinery18'
     ChargeSoundPitch=32
     ChargeTime=1.250000
     SpawnOffset=(X=10.000000,Y=10.000000,Z=-9.000000)
     FireModes(0)=(mProjClass=Class'BWBPOtherPackPro.RaygunPlagueChargedProjectile',mFireRate=0.800000,mFireChaos=0.500000,mFireSound=Sound'BWBPOtherPackSound.Raygun.Raygun-FireBig',mFireAnim="Fire",mRecoil=960.000000,mAmmoPerFire=8,bModeLead=True)
     MuzzleFlashClass=Class'BWBPOtherPackPro.RaygunMuzzleFlash'
     FlashScaleFactor=4.000000
     AimedFireAnim="Fire"
     RecoilPerShot=960.000000
     FireChaos=0.320000
     FireChaosCurve=(Points=((InVal=0,OutVal=1),(InVal=0.160000,OutVal=1),(InVal=0.250000,OutVal=1.500000),(InVal=0.500000,OutVal=2.250000),(InVal=0.750000,OutVal=3.500000),(InVal=1.000000,OutVal=5.000000)))
     BallisticFireSound=(Sound=Sound'BWBPOtherPackSound.Raygun.Raygun-FireBig',Volume=1.200000,Slot=SLOT_Interact,bNoOverride=False)
     bPawnRapidFireAnim=True
     bFireOnRelease=True
     MaxHoldTime=2.000000
     FireAnim="ChargedFire"
     FireEndAnim=
     FireRate=1.200000
     AmmoClass=Class'BWBPOtherPackPro.Ammo_RaygunCells'
     AmmoPerFire=8
     ShakeRotMag=(X=32.000000,Y=8.000000)
     ShakeRotRate=(X=10000.000000,Y=10000.000000,Z=10000.000000)
     ShakeRotTime=1.500000
     ShakeOffsetMag=(X=-3.000000)
     ShakeOffsetRate=(X=-1000.000000)
     ShakeOffsetTime=1.500000
     ProjectileClass=Class'BWBPOtherPackPro.RaygunChargedProjectile'
     BotRefireRate=0.250000
     WarnTargetPct=0.200000
}
