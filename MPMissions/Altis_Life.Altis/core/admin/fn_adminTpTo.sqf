#include <macro.h>
/*
    File: fn_adminTpTo.sqf
    Author: Dodge
    
    Description:
    Teleport you to a player.
*/
if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0;};

private["_target"];
_target = lbData[2902,lbCurSel (2902)];
_target = call compile format["%1", _target];
if(isNil "_target") exitwith {};
if(isNull _target) exitWith {};
if(_unit == player) exitWith {hint localize "STR_ANOTF_Error";};

player setPos (getPos _target);
hint format["You have teleported %1 to your location",_target getVariable["realname",name _target]];