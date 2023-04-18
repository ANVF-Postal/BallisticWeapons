//=============================================================================
// A500SecondaryFire.
//
// A500 Secondary fire is a blob projectile that causes a residual effect where it lands,
// damaging players in the area, and chewing away their armor.
//
// by Logan "BlackEagle" Richert.
// uses code by Nolan "Dark Carnivour" Richert.
// Copyright� 2011 RuneStorm. All Rights Reserved.
//=============================================================================
class A500SecondaryFire extends BallisticProProjectileFire;

var Sound 			ChargingSound;
var int 			AcidLoad;
var const int 		MaxAcidLoad;

function ModeHoldFire()
{
    if ( BW.HasMagAmmo(ThisModeNum) && (class'BallisticReplicationInfo'.static.IsArena() || class'BallisticReplicationInfo'.static.IsTactical()))
    {
        Super.ModeHoldFire();
		BW.bPreventReload = True;
        GotoState('Hold');
    }
}

state Hold
{
    simulated function BeginState()
    {
        AcidLoad = 0;
        SetTimer(0.5, true);
        Instigator.AmbientSound = ChargingSound;
		Instigator.SoundRadius = 256;
		Instigator.SoundVolume = 255;
        Timer();
    }

    simulated function Timer()
    {
		if (BW.HasMagAmmo(ThisModeNum))
		{
			AcidLoad++;
        	BW.ConsumeMagAmmo(ThisModeNum, 1);
		}
		
        if (AcidLoad == MaxAcidLoad || !BW.HasMagAmmo(ThisModeNum))
            SetTimer(0.0, false);
    }

    simulated function EndState()
    {
		if ( Weapon != None && Instigator != None)
		{
			BW.bPreventReload = False;
			Instigator.AmbientSound = None;
			Instigator.SoundRadius = Instigator.default.SoundRadius;
			Instigator.SoundVolume = Instigator.default.SoundVolume;
		}
    }
}

function SpawnProjectile (Vector Start, Rotator Dir)
{
	GoToState('');
	
	if (AcidLoad == 0)
		return;
		
	Proj = Spawn (ProjectileClass,,, Start, Dir);
	
	if (Proj != None)
	{
		Proj.Instigator = Instigator;
		A500AltProjectile(Proj).AcidLoad = float(AcidLoad)/float(MaxAcidLoad);
		A500AltProjectile(Proj).AdjustSpeed();
	}
}

defaultproperties
{
	 AcidLoad=1
	 MaxAcidLoad=8
     ChargingSound=Sound'GeneralAmbience.texture22'
     bFireOnRelease=True
     AmmoClass=Class'BallisticProV55.Ammo_A500Cells'

     ShakeRotMag=(X=32.000000,Y=8.000000)
     ShakeRotRate=(X=10000.000000,Y=10000.000000,Z=10000.000000)
     ShakeRotTime=1.500000
     ShakeOffsetMag=(X=-3.000000)
     ShakeOffsetRate=(X=-1000.000000)
     ShakeOffsetTime=1.500000

	 // AI
	 bInstantHit=True
	 bLeadTarget=True
	 bTossed=True

	 BotRefireRate=0.5
}
