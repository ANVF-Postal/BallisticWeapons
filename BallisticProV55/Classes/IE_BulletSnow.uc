//=============================================================================
// IE_BulletSnow.
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2005 RuneStorm. All Rights Reserved.
//=============================================================================
class IE_BulletSnow extends DGVEmitter
	placeable;

defaultproperties
{
     Begin Object Class=MeshEmitter Name=MeshEmitter0
         StaticMesh=StaticMesh'BallisticHardware2.Effects.VolumetricA2'
         UseMeshBlendMode=False
         RenderTwoSided=True
         UseParticleColor=True
         FadeOut=True
         RespawnDeadParticles=False
         UseSizeScale=True
         UseRegularSizeScale=False
         AutomaticInitialSpawning=False
         ColorScale(0)=(Color=(B=64,G=96,R=128,A=255))
         ColorScale(1)=(RelativeTime=1.000000,Color=(B=64,G=96,R=128,A=255))
         FadeOutStartTime=0.432000
         CoordinateSystem=PTCS_Relative
         MaxParticles=1
         SizeScale(1)=(RelativeTime=0.140000,RelativeSize=1.000000)
         SizeScale(2)=(RelativeTime=0.370000,RelativeSize=1.800000)
         SizeScale(3)=(RelativeTime=1.000000,RelativeSize=2.500000)
         StartSizeRange=(X=(Min=0.500000,Max=0.500000),Y=(Min=0.600000,Max=0.600000),Z=(Min=0.600000,Max=0.600000))
         InitialParticlesPerSecond=50000.000000
         DrawStyle=PTDS_Brighten
         SecondsBeforeInactive=0.000000
         LifetimeRange=(Min=1.200000,Max=1.200000)
     End Object
     Emitters(0)=MeshEmitter'BallisticProV55.IE_BulletSnow.MeshEmitter0'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter0
         UseCollisionPlanes=True
         UseMaxCollisions=True
         FadeOut=True
         FadeIn=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         UseRandomSubdivision=True
         Acceleration=(Z=-150.000000)
         ColorScale(0)=(Color=(B=64,G=96,R=128,A=255))
         ColorScale(1)=(RelativeTime=1.000000,Color=(B=64,G=111,R=128,A=255))
         Opacity=0.650000
         FadeOutStartTime=0.720000
         FadeInEndTime=0.120000
         MaxParticles=35
         SpinsPerSecondRange=(X=(Max=0.500000))
         StartSpinRange=(X=(Max=1.000000))
         SizeScale(0)=(RelativeSize=0.500000)
         SizeScale(1)=(RelativeTime=1.000000,RelativeSize=1.000000)
         StartSizeRange=(X=(Min=2.000000,Max=5.000000),Y=(Min=2.000000,Max=5.000000),Z=(Min=2.000000,Max=5.000000))
         InitialParticlesPerSecond=50000.000000
         DrawStyle=PTDS_Brighten
         Texture=Texture'BallisticEffects.Particles.FlameParts'
         TextureUSubdivisions=4
         TextureVSubdivisions=4
         SecondsBeforeInactive=0.000000
         LifetimeRange=(Min=1.500000,Max=1.500000)
         StartVelocityRange=(X=(Min=50.000000,Max=180.000000),Y=(Min=-30.000000,Max=30.000000),Z=(Min=-30.000000,Max=30.000000))
     End Object
     Emitters(1)=SpriteEmitter'BallisticProV55.IE_BulletSnow.SpriteEmitter0'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter1
         FadeOut=True
         FadeIn=True
         RespawnDeadParticles=False
         SpinParticles=True
         UniformSize=True
         AutomaticInitialSpawning=False
         ColorScale(0)=(Color=(B=64,G=96,R=128,A=255))
         ColorScale(1)=(RelativeTime=1.000000,Color=(B=64,G=96,R=128,A=255))
         Opacity=0.310000
         FadeOutFactor=(X=1.100000,Y=1.100000)
         FadeOutStartTime=1.080000
         FadeInEndTime=0.060000
         MaxParticles=3
         StartLocationOffset=(Z=10.000000)
         SpinsPerSecondRange=(X=(Max=0.200000))
         StartSizeRange=(X=(Min=5.000000,Max=10.000000),Y=(Min=5.000000,Max=10.000000),Z=(Min=5.000000,Max=10.000000))
         InitialParticlesPerSecond=50000.000000
         DrawStyle=PTDS_Brighten
         Texture=Texture'BallisticEffects.Particles.Smoke3'
         SecondsBeforeInactive=0.000000
         LifetimeRange=(Min=3.000000,Max=3.000000)
         StartVelocityRange=(X=(Max=10.000000),Y=(Min=-5.000000,Max=5.000000),Z=(Min=-5.000000,Max=5.000000))
     End Object
     Emitters(2)=SpriteEmitter'BallisticProV55.IE_BulletSnow.SpriteEmitter1'

     AutoDestroy=True
}
