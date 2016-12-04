systemChat "Stats are saving...";
[getPlayerUID player, 		getPlayerUID player, 		"Account Name", 			name player] call fn_SaveToServer; //===== Hells
sleep 1;
[getPlayerUID player, 		getPlayerUID player, 		"BankAccount", 			bankaccount] call fn_SaveToServer; //===== Hells
sleep 1; 
[getPlayerUID player, 		getPlayerUID player, 		"Licenses", 			INV_LicenseOwner] call fn_SaveToServer; //===== Hells
sleep 1;
[getPlayerUID player, 		getPlayerUID player, 		"Inventory", 			INV_InventoryArray] call fn_SaveToServer; //===== Hells
sleep 1;
[getPlayerUID player, 		getPlayerUID player, 		"privateStorage", 		private_storage] call fn_SaveToServer; //===== Hellss
sleep 1;
[getPlayerUID player, 		getPlayerUID player, 		"Level", 		BFLevel] call fn_SaveToServer; //===== Hellss
sleep 1;
[getPlayerUID player, 		getPlayerUID player, 		"Playtime", 		BFPlaytime] call fn_SaveToServer; //===== Hellss
sleep 1;
systemChat "Stats have saved!";
		