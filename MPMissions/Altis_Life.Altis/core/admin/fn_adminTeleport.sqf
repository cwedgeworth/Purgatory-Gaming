#include <macro.h>
/*
    File: fn_adminTeleport.sqf
    Author: ColinM9991
    Credits: To original script author(s)
    Description:
    Teleport to chosen position.
*/
if(__GETC__(life_adminlevel) == 0) exitWith {closeDialog 0;};

[] spawn {
while {dialog} do {
closeDialog 0;
sleep 0.01;
};
};
TitleText [format["Click on the map to Tele-Port"], "PLAIN DOWN"];

tele={
	_pos = [_this select 0, _this select 1,_this select 2];

	if ((vehicle player isKindOf "Air")) then{
		(vehicle player) setpos [_pos select 0, _pos select 1, 100];
		player setVariable["lastPos",0, true];
    }else
    {
		(vehicle player) setpos [_pos select 0, _pos select 1, 0];
    };
	openMap [false, false];
	TitleText [format[""], "PLAIN DOWN"];
	onMapSingleClick "";
    hint "You have teleported to your selected position";
};



openMap [true, false];
//onMapSingleClick "[_pos select 0, _pos select 1, _pos select 2] execVM ""\wuat\scripts\Teleport1.sqf""; True";
onMapSingleClick "[_pos select 0, _pos select 1, _pos select 2] call tele; True";
//onMapSingleClick "[_pos select 0, _pos select 1, _pos select 2] call tele"; 
//[] spawn {
//while {dialog} do {
//closeDialog 0;
//sleep 0.01;
//};
//};

//if !("ItemMap" in items player) then {
//	player addItem "ItemMap";	
//};




