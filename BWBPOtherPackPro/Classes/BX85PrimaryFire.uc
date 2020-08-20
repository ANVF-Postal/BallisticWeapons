class BX85PrimaryFire extends BallisticProInstantFire;

defaultproperties
{
	TraceRange=(Min=30000.000000,Max=30000.000000)
	WallPenetrationForce=0.000000
	
	Damage=95.000000
	DamageHead=140.000000
	DamageLimb=95.000000
	WaterRangeAtten=0.600000
	DamageType=Class'DTBX85Bolt'
	DamageTypeHead=Class'DTBX85Bolt'
	DamageTypeArm=Class'DTBX85Bolt'
	KickForce=6000
	PenetrateForce=0
	bPenetrate=False
	FireChaos=0.150000
	BallisticFireSound=(Sound=Sound'BWBPOtherPackSound.XBow.XBow-Fire',Volume=1.000000,Radius=64.000000)
	PreFireAnim=
	FireAnim="FireCycle"
	FireAnimRate=2.00000
	FireForce="AssaultRifleAltFire"
	FireRate=1.250000
	AmmoClass=Class'BWBPOtherPackPro.Ammo_BloodhoundDarts'
	ShakeRotTime=2.000000
	ShakeOffsetMag=(X=-20.000000)
	ShakeOffsetRate=(X=-1000.000000)
	ShakeOffsetTime=2.000000
	BotRefireRate=0.500000
	WarnTargetPct=0.500000
}
