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
if(!isPlayer _target) exitWith {hint "ORY? Does that look like a person to you?";};
if(player == _target) exitWith {hint "You can't ziptide yourself dumbass!";}; 
if(player distance _unit > 3) exitWith {hint "You can't ziptide that far away!";}; //too far
if(_target getVariable "restrained") exitWith {hint "You cannot ziptie someone that is restrained by the police!";}; //target already restrained
if(_target getVariable "ziptied") exitWith {"The target is already ziptied!";}; //target already zipided
if(!(_unit getVariable "Incapacitated") && !(_unit getVariable "surrender")) exitWith {hint "That player is not incapacitated or surrendering!";};

if(side player == civilian) then {
	if(!([false, "zipties", 1] call life_fnc_handleInv)) exitWith {hint "You do not have any zipties!";};
	hint "You have ziptied that person";

	//Broadcast
	_unit setVariable["surrender", false, true];
	_unit setVariable["ziptied", true, true];
	[[player], "life_fnc_civRestrain", _unit, false] spawn life_fnc_MP;
	[[0, format["%1 was ziptied by %2", _unit getVariable["realname", name _unit], profileName]], "life_fnc_broadcast", west, false] spawn life_fnc_MP;
};