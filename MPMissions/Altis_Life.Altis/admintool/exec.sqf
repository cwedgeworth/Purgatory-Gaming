// Admin Tool and Anti Hack costomized by aalexx
waituntil {!alive player ; !isnull (finddisplay 46)};
if ((getPlayerUID player) in ["76561198028512867","##########","##########"]) then {
	sleep 10;
	
	execVM "admintool\main.sqf";
	
	hint "Admin Tool Loaded";
}else {
   execVM "admintool\hackerSpanker.sqf";
   execVM "admintool\hackerSpanker2.sqf";
};