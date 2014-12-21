/*
	File: fn_unrestrain.sqf
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit OR !(_unit getVariable["ziptied",FALSE])) exitWith {}; //Error check?
if([false,"knife",1] call life_fnc_handleInv) then {
	_unit setVariable["ziptied",FALSE,TRUE];
	_unit setVariable["Escorting",FALSE,TRUE];
	_unit setVariable["transporting",FALSE,TRUE];
	[[0,format["%1 was cut free by %2",_unit getVariable["realname",name _unit], profileName]],"life_fnc_broadcast",west,FALSE] call life_fnc_MP;
	detach _unit;
} else {
	hint "You do not have a knife to unrestrain that person!";
};