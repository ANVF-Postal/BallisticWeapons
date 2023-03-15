//=============================================================================
// BallisticTab_WeaponRules.
//
// Server side options like rules that change the behaviour of the game and
// affect all players. These are used when hosting an MP or SP game.
//
// Edit By OJMoody
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2006 RuneStorm. All Rights Reserved.
//=============================================================================
class BallisticTab_GameRules extends UT2K4TabPanel;

var automated moComboBox	co_GameStyle;				//Choose Params
var automated moComboBox	co_InventoryMode;			//Choose Inventory Mode

//Add Killstreaks Here
var automated moNumericEdit int_MaxInventoryCapacity;	//Inventory Capacity
var automated moCheckbox	ch_BrightPlayers;			//Bright Players
var automated moCheckbox	ch_ForceBWPawn;				//Force Ballistic Pawn
var automated moCheckbox	ch_AllowDodging;			//Enables Dodging
var automated moCheckbox	ch_AllowDoubleJump;			//Enables Double Jump
var automated moCheckbox	ch_Regen;					//Enables Health Regen
var automated moCheckbox	ch_ShieldRegen;				//Enables Shield Regen
var automated moCheckbox	ch_PreCacheWeapons;			//Precache Weapons
var automated moCheckbox	ch_KillStreaks;				//Killsteaks

var BallisticConfigMenuPro	p_Anchor;					// reference to owner, which we're not even using right now - but I guess we will...
var bool					bInitialized;

//==================================================================
// General Menu Code
//==================================================================

function InitComponent(GUIController MyController, GUIComponent MyOwner)
{
	Super.InitComponent(MyController, MyOwner);

	if (BallisticConfigMenuPro(Controller.ActivePage) != None)
		p_Anchor = BallisticConfigMenuPro(Controller.ActivePage);
}

function ShowPanel(bool bShow)
{
	super.ShowPanel(bShow);
	if (bInitialized)
		return;
	LoadSettings();
	bInitialized = true;
}

//==================================================================
// Settings & Defaults
//==================================================================

function LoadSettings()
{
	local class<BC_GameStyle_Config> style;

    co_GameStyle.AddItem("Pro" ,,string(0));
	co_GameStyle.AddItem("Classic" ,,string(1));
	co_GameStyle.AddItem("Realism" ,,string(2));
    co_GameStyle.AddItem("Tactical" ,,string(3));

	co_GameStyle.ReadOnly(True);
	co_GameStyle.SetIndex(class'BallisticGameStyles'.default.CurrentStyle);

	co_InventoryMode.AddItem("Pickups" ,,string(0));
	co_InventoryMode.AddItem("Outfitting Loadout" ,,string(1));
	co_InventoryMode.AddItem("Conflict Loadout" ,,string(2));
	co_InventoryMode.AddItem("Evolution Loadout" ,,string(3));
	co_InventoryMode.AddItem("Arena" ,,string(4));
	co_InventoryMode.AddItem("Melee" ,,string(4));
	co_InventoryMode.ReadOnly(True);

	ch_PreCacheWeapons.Checked(class'Mut_Ballistic'.default.bPreloadMeshes);
	ch_ForceBWPawn.Checked(class'Mut_Ballistic'.default.bForceBallisticPawn);

	style = class'BallisticGameStyles'.static.GetClientLocalConfigStyle();

	if (style != None)
	{
		co_InventoryMode.SetIndex(style.default.class.default.InventoryModeIndex);
		int_MaxInventoryCapacity.SetValue(style.default.class.default.MaxInventoryCapacity);
		ch_BrightPlayers.Checked(style.default.class.default.bBrightPlayers);
		ch_AllowDodging.Checked(style.default.class.default.bAllowDodging);
		ch_AllowDoubleJump.Checked(style.default.class.default.bAllowDoubleJump);
		ch_Regen.Checked(style.default.class.default.bRegeneration);
		ch_ShieldRegen.Checked(style.default.class.default.bShieldRegeneration);
		ch_KillStreaks.Checked(style.default.class.default.bKillstreaks);
	}
}

function SaveSettings()
{
	local class<BC_GameStyle_Config> style;

	if (!bInitialized)
		return;

	class'BallisticGameStyles'.default.GameStyle       			= EGameStyle(co_GameStyle.GetIndex());
	class'BallisticGameStyles'.default.StaticSaveConfig();

	// stuff that's not game style relevant:
	class'Mut_Ballistic'.default.bPreloadMeshes					= ch_PreCacheWeapons.IsChecked();
    class'Mut_Ballistic'.default.bForceBallisticPawn			= ch_ForceBWPawn.IsChecked();
	class'Mut_Ballistic'.static.StaticSaveConfig();

	style = class'BallisticGameStyles'.static.GetClientLocalConfigStyle();

	if (style != None)
	{
		style.default.InventoryModeIndex		= co_InventoryMode.GetIndex();
		style.default.MaxInventoryCapacity 	= int_MaxInventoryCapacity.GetValue();	
		style.default.bAllowDodging			= ch_AllowDodging.IsChecked();
		style.default.bAllowDoubleJump 		= ch_AllowDoubleJump.IsChecked();
		style.default.bBrightPlayers			= ch_BrightPlayers.IsChecked();
		style.default.bRegeneration			= ch_Regen.IsChecked();
		style.default.bShieldRegeneration		= ch_ShieldRegen.IsChecked();
		style.default.bKillstreaks			= ch_KillStreaks.IsChecked();
		style.default.class.static.StaticSaveConfig();
	}
}

function DefaultSettings()
{
    co_GameStyle.SetIndex(0);
	co_InventoryMode.SetIndex(0);

	int_MaxInventoryCapacity.SetValue(0);
	ch_BrightPlayers.Checked(false);
	ch_ForceBWPawn.Checked(false);
	ch_AllowDodging.Checked(false);
	ch_AllowDoubleJump.Checked(false);
	ch_Regen.Checked(false);
	ch_ShieldRegen.Checked(false);
	ch_PreCacheWeapons.Checked(true);
	ch_KillStreaks.Checked(false);
}

defaultproperties
{	 
    Begin Object Class=moComboBox Name=co_GameStyleCombo
         ComponentJustification=TXTA_Left
         CaptionWidth=0.550000
         Caption="Game Style"
         OnCreateComponent=co_GameStyleCombo.InternalOnCreateComponent
         IniOption="@Internal"
         IniDefault="High"
         Hint="Determines the general gameplay of Ballistic Weapons.||Arena: Fast, close to UT2004 speed, balanced.|Classic: Ballistic V2.5 gameplay.|Realism: More realistic.|Tactical: Slower movement with higher damage and stronger locational damage."
         WinTop=0.050000
         WinLeft=0.250000
		 WinHeight=0.040000
    End Object
    co_GameStyle=moComboBox'co_GameStyleCombo'

	 Begin Object Class=moComboBox Name=co_InventoryModeCombo
         ComponentJustification=TXTA_Left
         CaptionWidth=0.550000
         Caption="Inventory Mode"
         OnCreateComponent=co_InventoryModeCombo.InternalOnCreateComponent
         IniOption="@Internal"
         IniDefault="High"
         Hint="Determines the Weapon Spawns of Ballistic Weapons"
         WinTop=0.100000
         WinLeft=0.250000
		 WinHeight=0.040000
     End Object
     co_InventoryMode=moComboBox'co_InventoryModeCombo'

	 Begin Object Class=moCheckBox Name=ch_PreCacheCheck
         ComponentJustification=TXTA_Left
         CaptionWidth=0.900000
         Caption="Precache Weapons"
         OnCreateComponent=ch_PreCacheCheck.InternalOnCreateComponent
         IniOption="@Internal"
         Hint="Precache weapons at the start of the match."
         WinTop=0.1500000
         WinLeft=0.250000
         WinHeight=0.040000
     End Object
     ch_PreCacheWeapons=moCheckBox'BallisticProV55.BallisticTab_GameRules.ch_PreCacheCheck'
	 
	 Begin Object Class=moNumericEdit Name=int_MaxWepsInt
         MinValue=0
         MaxValue=999
         ComponentJustification=TXTA_Left
         CaptionWidth=0.800000
         Caption="Player Inventory Capacity"
         OnCreateComponent=int_MaxWepsInt.InternalOnCreateComponent
         IniOption="@Internal"
         Hint="Sets the player's maximum inventory capacity. 0 is infinite."
         WinTop=0.200000
         WinLeft=0.250000
         WinHeight=0.040000
     End Object
     int_MaxInventoryCapacity=moNumericEdit'BallisticProV55.BallisticTab_GameRules.int_MaxWepsInt'

	 Begin Object Class=moCheckBox Name=ch_BrightPlayersCheck
         ComponentJustification=TXTA_Left
         CaptionWidth=0.900000
         Caption="Bright Players"
         OnCreateComponent=ch_BrightPlayersCheck.InternalOnCreateComponent
         IniOption="@Internal"
         Hint="Makes players glow in the dark like normal UT2004. Only affects BW gametypes - standard gametypes have bright players already."
         WinTop=0.250000
         WinLeft=0.250000
         WinHeight=0.040000
     End Object
     ch_BrightPlayers=moCheckBox'BallisticProV55.BallisticTab_GameRules.ch_BrightPlayersCheck'

	 Begin Object Class=moCheckBox Name=ch_ForceBWPawnCheck
         ComponentJustification=TXTA_Left
         CaptionWidth=0.900000
         Caption="Force Ballistic Pawn"
         OnCreateComponent=ch_ForceBWPawnCheck.InternalOnCreateComponent
         IniOption="@Internal"
         Hint="BW mutators will try to force the Ballistic pawn even when game specific pawn is used.||WARNING: Can cause severe problems in some gametypes."
         WinTop=0.300000
         WinLeft=0.250000
         WinHeight=0.040000
     End Object
     ch_ForceBWPawn=moCheckBox'BallisticProV55.BallisticTab_GameRules.ch_ForceBWPawnCheck'

	 Begin Object Class=moCheckBox Name=ch_AllowDodgingCheck
         ComponentJustification=TXTA_Left
         CaptionWidth=0.900000
         Caption="Disable Dodging"
         OnCreateComponent=ch_AllowDodgingCheck.InternalOnCreateComponent
         IniOption="@Internal"
         Hint="Disables dodging for all players."
         WinTop=0.350000
         WinLeft=0.250000
         WinHeight=0.040000
     End Object
     ch_AllowDodging=moCheckBox'BallisticProV55.BallisticTab_GameRules.ch_AllowDodgingCheck'

    Begin Object Class=moCheckBox Name=ch_AllowDoubleJumpCheck
         ComponentJustification=TXTA_Left
         CaptionWidth=0.900000
         Caption="Disable Double Jump"
         OnCreateComponent=ch_AllowDoubleJumpCheck.InternalOnCreateComponent
         IniOption="@Internal"
         Hint="Disables double jump for all players."
         WinTop=0.400000
         WinLeft=0.250000
         WinHeight=0.040000
     End Object
     ch_AllowDoubleJump=moCheckBox'BallisticProV55.BallisticTab_GameRules.ch_AllowDoubleJumpCheck'
	 
	 Begin Object Class=moCheckBox Name=ch_RegenCheck
         ComponentJustification=TXTA_Left
         CaptionWidth=0.900000
         Caption="Health Regeneration"
         OnCreateComponent=ch_RegenCheck.InternalOnCreateComponent
         IniOption="@Internal"
         Hint="Enables health regeneration."
         WinTop=0.450000
         WinLeft=0.250000
         WinHeight=0.040000
     End Object
     ch_Regen=moCheckBox'BallisticProV55.BallisticTab_GameRules.ch_RegenCheck'
	 
	 Begin Object Class=moCheckBox Name=ch_ShieldRegenCheck
         ComponentJustification=TXTA_Left
         CaptionWidth=0.900000
         Caption="Shield Regeneration"
         OnCreateComponent=ch_ShieldRegenCheck.InternalOnCreateComponent
         IniOption="@Internal"
         Hint="Enables shield regeneration."
         WinTop=0.500000
         WinLeft=0.250000
         WinHeight=0.040000
     End Object
     ch_ShieldRegen=moCheckBox'BallisticProV55.BallisticTab_GameRules.ch_ShieldRegenCheck'
	 
	 Begin Object Class=moCheckBox Name=ch_KillStreaksCheck
         ComponentJustification=TXTA_Left
         CaptionWidth=0.900000
         Caption="Killstreaks"
         OnCreateComponent=ch_KillStreaksCheck.InternalOnCreateComponent
         IniOption="@Internal"
         Hint="Enables killstreaks. Configured via the Loadout tab."
         WinTop=0.550000
         WinLeft=0.250000
         WinHeight=0.040000
     End Object
     ch_KillStreaks=moCheckBox'BallisticProV55.BallisticTab_GameRules.ch_KillStreaksCheck'
}