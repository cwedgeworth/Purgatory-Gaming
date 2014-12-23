#include <macro.h>
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for the weapon shops.
	
	Return:
	String: Close the menu
	Array: 
	[Shop Name,
	[ //Array of items to add to the store
		[classname,Custom Name (set nil for default),price]
	]]
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_shop) do
{
	case "cop_basic":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			default
			{
				["Altis Cop Shop",
					[
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["NVGoggles",nil,2000],
						["ItemGPS",nil,100],
						["Binocular",nil,150],
						["hgun_P07_snds_F",nil,5000], // 907 9mm
						["hgun_Rook40_F",nil,5500], // Rook 40
						["SMG_02_F",nil,9500], // Sting 9mm
						["16Rnd_9x21_Mag",nil,250], //Taser Ammo
						["30Rnd_9x21_Mag",nil,550], // 30rnd 9mm Ammo
						["hgun_acpc2_F",nil,7500], // ACP-C2 .45
						["9Rnd_45ACP_Mag",nil,550], // 9Rnd .45 Ammo
						["acc_flashlight",nil,750], // Flashlight
						["HandGrenade_Stone","Flashbang",1700], // Flashbang
						["optic_Holosight",nil,1200], // Halosight
						["optic_ACO_grn",nil,3500] // ACO
					]
				];
			};
		};
	};
	
	case "med_basic":
	{
		switch (true) do 
		{
			case (playerSide != independent): {"You are not an EMS Medic"};
			default {
				["Hospital EMS Shop",
					[
						["ItemGPS",nil,100],
						["Binocular",nil,150],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,500],
						["NVGoggles",nil,1200],
						["B_FieldPack_ocamo",nil,3000],
						["B_Carryall_oucamo",nil,5000]
					]
				];
			};
		};
	};

	case "cop_patrol":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(life_coplevel) < 3): {"You are not at a patrol officer rank!"};
			default
			{
				["Altis Patrol Officer Shop",
					[
						["hgun_P07_F",nil,5000], // 907 9mm
						["hgun_Rook40_F",nil,5500], // Rook 40
						["SMG_02_F",nil,9500], // Sting 9mm
						["16Rnd_9x21_Mag",nil,250], //Taser Ammo
						["30Rnd_9x21_Mag",nil,550], // 30rnd 9mm Ammo
						["hgun_acpc2_F",nil,7500], // ACP-C2 .45
						["9Rnd_45ACP_Mag",nil,550], // 9Rnd .45 Ammo
						["optic_ACO_grn",nil,3500] // ACO Green Sight
					]
				];
			};
		};
	};

	case "cop_sergeant":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(life_coplevel) < 5): {"You are not at a sergeant rank!"};
			default
			{
				["Altis Sergeant Officer Shop",
					[
						["arifle_MX_F",nil,45000], // MX Assault
						["arifle_MXM_F",nil,45000], // MXM Marksmen
						["HandGrenade_Stone","Flashbang",1700], // Flashbang
						["optic_Arco",nil,2500], // ARCO Sight
						["30Rnd_65x39_caseless_mag",nil,100] // 6.5mm Ammo
					]
				];
			};
		};
	};
	
	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_rebel): {"You don't have a Rebel training license!"};
			default
			{
				["Mohammed's Jihadi Shop",
					[
						["hgun_acpc2_F",nil,5000], // ACP-C2 .45
						["hgun_pdw2000_F",nil,11500], // PDW2000
						["arifle_SDAR_F",nil,19500], // SDAR
						["arifle_TRG20_F",nil,35000], // TRG20
						["SMG_01_F",nill,38000], // Vermin SMG
						["arifle_Katiba_F",nil,50000], // Katiba
						["optic_ACO_grn",nil,3500], // ACO Green Sight
						["optic_Holosight",nil,3600], // MK-17 Halosight
						["acc_flashlight",nil,1000], // Flashlight
						["optic_Hamr",nil,7500], // RCOSight
						["optic_MRCO",nil,10000], // ARCO Sight
						["30Rnd_9x21_Mag",nil,550], // 30Rnd 9mm
						["9Rnd_45ACP_Mag",nil,550], // 9Rnd .45 Ammo
						["20Rnd_556x45_UW_mag",nil,125], // 5.56 Ammo
						["30Rnd_556x45_Stanag",nil,300], // 5.56 Stanag
						["30Rnd_65x39_caseless_green",nil,275] // 6.5mm Caseless
					]
				];
			};
		};
	};
	
	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_gun): {"You don't have a Firearms license!"};
			default
			{
				["Billy Joe's Firearms",
					[
						["hgun_pistol_signal_F",nil,2500], // Starter Pistol
						["hgun_P07_F",nil,5000], // P07 9mm
						["hgun_Rook40_F",nil,5500], // Rook 40 9mm
						["hgun_acpc2_F",nil,8500], // ACP-C2 .45
						["hgun_PDW2000_F",nil,25000], // PDW2000
						["arifle_SDAR_F",nil,21500], // SDAR
						["optic_ACO_grn_smg",nil,5500], // ACO Green SMG
						["optic_ACO_grn",nil,2500], // ACO Green
						["optic_ACO",nil,2500], // ACO Red
						["V_Rangemaster_belt",nil,4900], // Rangemaster Belt
						["16Rnd_9x21_Mag",nil,25], // 16Rnd 9mm Ammo
						["9Rnd_45ACP_Mag",nil,45], // .45 Ammo
						["6Rnd_45ACP_Cylinder",nil,50], // .45 ACP Cylinder ammo
						["6Rnd_GreenSignal_F",nil,25], // Starter Pistol Ammo
						["20Rnd_556x45_UW_mag",nil,125], // 5.56 Ammo
						["30Rnd_556x45_Stanag",nil,300], // 5.56 Stanag
						["30Rnd_9x21_Mag",nil,75] // 30Rnd 9mm
					]
				];
			};
		};
	};
	
	case "gang":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			default
			{
				["Hideout Armament",
					[
						["hgun_Rook40_F",nil,1500],
						["hgun_ACPC2_F",nil,4500],
						["hgun_PDW2000_F",nil,10500],
						["SMG_02_F",nil,9500], // Sting 9mm
						["optic_ACO_grn_smg",nil,950],
						["V_Rangemaster_belt",nil,1900],
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["6Rnd_45ACP_Cylinder",nil,50],
						["30Rnd_9x21_Mag",nil,75]
					]
				];
			};
		};
	};
	
	case "genstore":
	{
		["Altis General Store",
			[
				["Binocular",nil,150],
				["ItemGPS",nil,100],
				["ToolKit",nil,250],
				["FirstAidKit",nil,150],
				["NVGoggles",nil,2000],
				["Chemlight_red",nil,300],
				["Chemlight_yellow",nil,300],
				["Chemlight_green",nil,300],
				["Chemlight_blue",nil,300]
			]
		];
	};
};
