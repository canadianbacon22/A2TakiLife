disableSerialization;

sleep 10;

while {true} do {
	waitUntil {sleep 0.121;!isnull (findDisplay 49)};

	_ctrl = (findDisplay 49) displayCtrl 104;
	_ctrl ctrlEnable false;

	_enCtrl = [] spawn {
		disableSerialization;
		
		_ctrl = (findDisplay 49) displayCtrl 104;
		_stext = ctrlText _ctrl;

		for "_i" from 5 to 1 step -1 do {
		
				if (isnull (findDisplay 49)) exitWith {};
				
				_text = _stext + format [" | Saving (%1s)",_i]; _ctrl ctrlSetText _text;
				//_text2 = _stext2 + format ["(%1)",_i]; _ctrl2 ctrlSetText _text2;
				
				sleep 1;
			};
		
		_h = [] execVM "Awesome\Client\statssave_abort.sqf";
		waitUntil{scriptDone  _h};
	
		if (!isnull (findDisplay 49)) then 
			{
				_ctrl ctrlSetText _stext; _ctrl ctrlEnable true;
			};
	};

	waitUntil {isNull (findDisplay 49)};
	
	if (!scriptDone _enCtrl) then {terminate _enCtrl};
};
