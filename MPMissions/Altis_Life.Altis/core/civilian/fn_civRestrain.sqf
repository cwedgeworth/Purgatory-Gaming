/*
	File: fn_civRestrain.sqf
	Author: Bryan "Tonic" Boardwine
	Edited by: Dodge
	
	Description:
	Retrains the target.
*/

private["_target"];
_target = cursorTarget;
if(isNull _target) exitWith {}; //no target selected
if(!isPlayer _target) exitWith {}; //the target is not a player
if(player == _target) exitWith {}; //you can't ziptide yourself dumbass
if(_target getVariable "restrained") exitWith {}; //target already restrained
if(_target getVariable "ziptied") exitWith {}; //target already zipided
if(!(_target getVariable "Incapacitated")) exitWith {}; //target not Incapacitated
if(!(_target getVariable "surrender")) exitWith {}; //this target surrendered


if(side player == civilian) then {
	if(life_inv_zipties < 1) exitWith {hint"You need a zip ties to restrain someone."};
	life_inv_zipties = life_inv_zipties - 1;
	_target setVariable["ziptied", true, true];
	hint "Your target was restrained";
	[[player], "life_fnc_civRestrain", _target, false] spawn life_fnc_MP;
	[[0,format["%1 was ziptied by %2",_unit getVariable["realname", name _unit], player getVariable["realname",name player]]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
};