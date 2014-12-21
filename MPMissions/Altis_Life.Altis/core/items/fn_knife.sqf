/*
	File: fn_lockpick.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for lock-picking.
*/
private["_curTarget","_distance","_isVehicle","_title","_progressBar","_cP","_titleText","_dice","_badDistance"];
/*_curTarget = cursorTarget;
if(_curTarget getVariable["ziptied",FALSE]) exitWith {};
if(isNull _curTarget) exitWith {}; //Bad type
_distance = ((boundingBox _curTarget select 1) select 0) + 2;
if(_curTarget isKindOf "Man") then {
	//if(player distance _curTarget > _distance) exitWith {}; //Too far

	//More error checks
	if(!_isVehicle && !isPlayer _curTarget) exitWith {};
	if(!_isVehicle && !(_curTarget getVariable["ziptied",false])) exitWith {};

	_curTarget setVariable["ziptied",FALSE,TRUE];
	hint "You cut off their zipties.";
	[false,"knife",1] call life_fnc_handleInv;
};*/

if(isNull cursorTarget) exitWith {};

_var = ["knife",0] call life_fnc_varHandle;
_value = missionNamespace getVariable _var;

if(_value < 1) exitWith {};

if(cursorTarget isKindOf "Man") then {
	cursorTarget setVariable["ziptied",false,true];
	hint "You cut off their zipties.";
	//[false,"knife",1] call life_fnc_handleInv;
};