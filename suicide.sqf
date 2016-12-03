 private ["_suicider"];
 _art = _this select 0;
 _suicider = name player;

if (_art == "use") then

{

_item   = _this select 1;
_anzahl = _this select 2;
"hint localize ""STRS_inv_item_selbstmordbombe_globalmsg"";" call broadcast;
liafu = true;
for [{_i=5}, {_i >= 0}, {_i=_i-1}] do

	{

	titletext [format ["Bombcountdown: -->*%1*<--", _i],"plain"];
	sleep 1;

	};

if (!(alive player)) exitWith {};
call compile format ["liafu = true; autobombe%2 = createVehicle [""Bo_GBU12_LGB"", (%1), [], 0, ""NONE""];",(getpos player), (round (random 2000))];
[_item, -1] call INV_AddInventoryItem;
format ["hint ""%1 got his 72 virgins"";", _suicider] call broadcast;
format ["server globalChat ""%1 DETONATED A SUICIDE BOMB!"";", _suicider] call broadcast;
};
