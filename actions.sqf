if(A_running) exitwith {};
A_running = true;

_role = player;
//====================================== HQ BOMB ======================================================
action1 =	_role addaction ["Defuse Bomb","noscript.sqf",'if(planting)exitwith{};planting=true;player playmove "AinvPknlMstpSlayWrflDnon_medic";sleep 4;waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};planting=false;if(!alive player)exitwith{};bombactive=false;publicvariable "bombactive";"hint ""The bomb has been defused!"";server globalchat ""The bomb has been defused!"";playsound ""fanfare"";" call broadcast;',1,false,true,"","player distance HQ <= 5 and iscop and bombactive and !planting"];
action2 =	_role addaction ["Plant Bomb","noscript.sqf",'if(planting)exitwith{};planting=true;publicvariable "planting";player playmove "AinvPknlMstpSlayWrflDnon_medic";sleep 4;waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};planting=false;publicvariable "planting";if(!alive player)exitwith{};bombactive=true;publicvariable "bombactive";',1,false,true,"","player distance HQ <= 5 and !bombactive and !planting and isciv"];
//====================================== BANK ROB =====================================================
action4 =	_role addaction ["Rob safe","bankrob.sqf", ["ausrauben", safe1],1,false,true,"","player distance safe1 <= 3 and isciv"];
action5 =	_role addaction ["Rob safe","bankrob.sqf", ["ausrauben", safe2],1,false,true,"","player distance safe2 <= 3 and isciv"];
action6 =	_role addaction ["Rob safe","bankrob.sqf", ["ausrauben", safe3],1,false,true,"","player distance safe3 <= 3 and isciv"];
//===================================== ASSASSINATION =================================================
action8 = 	_role addaction ["Get Assassination job","assassination.sqf",["getajob_assassin"],1,false,true,"","player distance assassin <= 3 and isciv"];
action9 =   _role addaction ["Escort VIP", "noscript.sqf", "[VIPtarget] join (group player); player groupchat ""escort the VIP to the police base before he is assassinated!"";",1,false,true,"","player distance VIPtarget < 5 and iscop"];


//========================================= HUNTING ===================================================
action_h1 =  _role addaction ["Take boar meat","noscript.sqf",
'_no = ceil(random 7);if (((call INV_GetOwnWeight) + ("boar" call INV_GetItemTypeKg)*_no) > INV_CarryingCapacity)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};(nearestobjects [getpos player, ["wildboar"],  3] select 0) setvariable ["inuse", 1, true]; player playmove "AinvPknlMstpSlayWrflDnon_medic";sleep 4;waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};deletevehicle (nearestobjects [getpos player, ["wildboar"],  3] select 0);["boar", _no] call INV_AddInventoryItem;player groupchat format["you got %1 boar meat", _no];',
1,true,true,"",
'_w = (nearestobjects [getpos player, ["wildboar"],  3] select 0) getvariable "inuse"; isnil "_w" and player distance (nearestobjects [getpos player, ["wildboar"],  3] select 0) < 5 and !alive (nearestobjects [getpos player, ["wildboar"],  3] select 0) and isciv'];

action_h2 =	_role addaction ["Take rabbit meat","noscript.sqf",
'_no = ceil(random 2);if (((call INV_GetOwnWeight) + ("rabbit" call INV_GetItemTypeKg)*_no) > INV_CarryingCapacity)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};(nearestobjects [getpos player, ["rabbit"],  3] select 0) setvariable ["inuse", 1, true]; player playmove "AinvPknlMstpSlayWrflDnon_medic";sleep 4;waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};deletevehicle (nearestobjects [getpos player, ["rabbit"],  3] select 0);["rabbit", _no] call INV_AddInventoryItem;player groupchat format["you got %1 rabbit meat", _no];',
1,true,true,"",
'_w = (nearestobjects [getpos player, ["rabbit"],  3] select 0) getvariable "inuse"; isnil "_w" and player distance (nearestobjects [getpos player, ["rabbit"],  3] select 0) < 5 and !alive (nearestobjects [getpos player, ["rabbit"],  3] select 0) and isciv'];

action_h3 =	_role addaction ["Take Chicken meat","noscript.sqf",
'_no = ceil(random 2);if (((call INV_GetOwnWeight) + ("chicken" call INV_GetItemTypeKg)*_no) > INV_CarryingCapacity)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};(nearestobjects [getpos player, ["Hen"],  3] select 0) setvariable ["inuse", 1, true]; player playmove "AinvPknlMstpSlayWrflDnon_medic";sleep 4;waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};deletevehicle (nearestobjects [getpos player, ["Hen"],  3] select 0);["chicken", _no] call INV_AddInventoryItem;player groupchat format["you got %1 chicken meat", _no];',
1,true,true,"",
'_w = (nearestobjects [getpos player, ["Hen"],  3] select 0) getvariable "inuse"; isnil "_w" and player distance (nearestobjects [getpos player, ["Hen"],  3] select 0) < 5 and !alive (nearestobjects [getpos player, ["Hen"],  3] select 0) and isciv'];

action_h4 =	_role addaction ["Take Cow meat","noscript.sqf",
'_no = ceil(random 2);if (((call INV_GetOwnWeight) + ("cow" call INV_GetItemTypeKg)*_no) > INV_CarryingCapacity)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};(nearestobjects [getpos player, ["Cow"],  3] select 0) setvariable ["inuse", 1, true]; player playmove "AinvPknlMstpSlayWrflDnon_medic";sleep 4;waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};deletevehicle (nearestobjects [getpos player, ["Cow"],  3] select 0);["cow", _no] call INV_AddInventoryItem;player groupchat format["you got %1 cow meat", _no];',
1,true,true,"",
'_w = (nearestobjects [getpos player, ["Cow"],  3] select 0) getvariable "inuse"; isnil "_w" and player distance (nearestobjects [getpos player, ["Cow"],  3] select 0) < 5 and !alive (nearestobjects [getpos player, ["Cow"],  3] select 0) and isciv'];

action_h5 =	_role addaction ["Take Dog meat","noscript.sqf",
'_no = ceil(random 2);if (((call INV_GetOwnWeight) + ("dog" call INV_GetItemTypeKg)*_no) > INV_CarryingCapacity)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};(nearestobjects [getpos player, ["Fin", "Pastor"],  3] select 0) setvariable ["inuse", 1, true]; player playmove "AinvPknlMstpSlayWrflDnon_medic";sleep 4;waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};deletevehicle (nearestobjects [getpos player, ["Fin", "Pastor"],  3] select 0);["dog", _no] call INV_AddInventoryItem;player groupchat format["you got %1 dog meat", _no];',
1,true,true,"",
'_w = (nearestobjects [getpos player, ["Fin", "Pastor"],  3] select 0) getvariable "inuse"; isnil "_w" and player distance (nearestobjects [getpos player, ["Fin", "Pastor"],  3] select 0) < 5 and !alive (nearestobjects [getpos player, ["Fin", "Pastor"],  3] select 0) and isciv'];

action_h6 =	_role addaction ["Take Sheep meat","noscript.sqf",
'_no = ceil(random 2);if (((call INV_GetOwnWeight) + ("sheep" call INV_GetItemTypeKg)*_no) > INV_CarryingCapacity)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};(nearestobjects [getpos player, ["Sheep"],  3] select 0) setvariable ["inuse", 1, true]; player playmove "AinvPknlMstpSlayWrflDnon_medic";sleep 4;waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};deletevehicle (nearestobjects [getpos player, ["Sheep"],  3] select 0);["sheep", _no] call INV_AddInventoryItem;player groupchat format["you got %1 sheep meat", _no];',
1,true,true,"",
'_w = (nearestobjects [getpos player, ["Sheep"],  3] select 0) getvariable "inuse"; isnil "_w" and player distance (nearestobjects [getpos player, ["Sheep"],  3] select 0) < 5 and !alive (nearestobjects [getpos player, ["Sheep"],  3] select 0) and isciv'];

action_h7 =	_role addaction ["Take Goat meat","noscript.sqf",'_no = ceil(random 2);
 _bomb = ceil(random 10);
  if (((call INV_GetOwnWeight) + ("goat" call INV_getitemTypeKg)*_no) > INV_CarryingCapacity)
  exitwith
  {
	  player groupChat localize "STRS_inv_buyitems_maxgewicht"
  };
  (nearestobjects [getpos player, ["Goat"],  3] select 0) setvariable ["inuse", 1, true];
   player playmove "AinvPknlMstpSlayWrflDnon_medic";
   sleep 4;
   waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};
   _handle = ["Goat"] execVM "boom.sqf";
   waitUntil{scriptDone _handle};
   deletevehicle (nearestobjects [getpos player, ["Goat"],  3] select 0);
   ["goat", _no] call INV_AddInventoryItem;
   player groupchat format["you got %1 goat meat", _no];
   ',1,true,true,"",'_w = (nearestobjects [getpos player, ["Goat"],  3] select 0) getvariable "inuse";
   isnil "_w" and player distance (nearestobjects [getpos player, ["Goat"],  3] select 0) < 5 and !alive (nearestobjects [getpos player, ["Goat"],  3] select 0) and isciv'];


//===================================== TARGET RESET ==================================================
action12 = _role addaction ["Reset targets","noscript.sqf",'{_x animate["terc",0]} foreach (nearestobjects [getPosATL player, ["TargetEpopup","TargetPopUpTarget"],  100])',1,true,true,"",'player distance gunshop1 < 5'];
action113 = _role addaction ["Reset targets","noscript.sqf",'{_x animate["terc",0]} foreach (nearestobjects [getPosATL coprangetrigger, ["TargetEpopup","TargetPopUpTarget","TargetFakeTank_Lockable_EP1"],  900])',1,true,true,"",'player distance coprangereset < 5'];
//===================================== IMPOUND AREA ==================================================
action21 = _role addaction ["Impound Lot","maindialogs.sqf",["impound"],1,false,true,"","player distance impoundbuy <= 5"];
action22 = _role addaction ["Impound Lot","maindialogs.sqf",["impound"],1,false,true,"","player distance copcar <= 5"];
//================================== COP DELETE EVIDENCE ================================================
//action23 = _role addaction ["Take evidence","noscript.sqf",'player groupchat "evidence removed."; {deletevehicle _x} foreach (nearestobjects [getpos player, ["weaponholder"], 3])',1,true,true,"",'_weps = (nearestobjects [getpos player, ["weaponholder"], 3] select 0); player distance _weps < 5 and iscop'];
//================================== COP SLAVE ACTIONS ================================================
action24 = _role addaction ["Who do you work for?","noscript.sqf",'player groupchat format["this slave works for %1.", leader (nearestobjects [getpos player, civslavearray,  3] select 0)]',1,true,true,"",'_slave = (nearestobjects [getpos player, civslavearray, 3] select 0); !(_slave in playerarray) and player distance _slave < 5 and (leader _slave) in playerarray and iscop'];
action25 = _role addaction ["Set slave free","noscript.sqf",'_slave = (nearestobjects [getpos player, civslavearray,  3] select 0); _civ = leader _slave; deletevehicle _slave; (format ["[""slave"", %1] spawn Isse_AddCrimeLogEntry; if(!(""being a slaver"" in %1_reason))then{%1_reason = %1_reason + [""being a slaver""]}; %1_wanted = 1; kopfgeld_%1 = kopfgeld_%1 + 20000;", _civ]) call broadcast;player groupchat "the slave has been freed!";',1,true,true,"",'_slave = (nearestobjects [getpos player, civslavearray, 3] select 0); !(_slave in playerarray) and player distance _slave < 5 and (leader _slave) in playerarray and iscop'];
//==================================== REPAIR POWER ===================================================
action41 = _role addaction [format["Restore Power 1 ($%1)", powerrestorecost],"noscript.sqf",'_moneh = "money" call INV_GetItemAmount; if(_moneh < powerrestorecost)exitwith{player groupchat "you do not have enough money"};["money", -(powerrestorecost)] call INV_AddInventoryItem; "power1 setdamage 0;liafu = true;" call broadcast',1,false,true,"","player distance power1 <= 7 and !alive power1 and iscop"];
action42 = _role addaction [format["Restore Power 2 ($%1)", powerrestorecost],"noscript.sqf",'_moneh = "money" call INV_GetItemAmount; if(_moneh < powerrestorecost)exitwith{player groupchat "you do not have enough money"};["money", -(powerrestorecost)] call INV_AddInventoryItem; "power2 setdamage 0;liafu = true;" call broadcast',1,false,true,"","player distance power2 <= 7 and !alive power2 and iscop"];
//================================== COP CHIEF ELECTION ===============================================
action43 = _role addaction ["Elect a Chief","maindialogs.sqf",["chief"],1,false,true,"","player distance rathaus <= 3 and iscop"];
//==================================== MAYOR ELECTION =================================================
action44 = _role addaction ["Elect a President","maindialogs.sqf",["wahlen"],1,false,true,"","player distance rathaus <= 3"];
//===================================== MAYOR ACTIONS =================================================
action45 = _role addaction ["Change the Law","maindialogs.sqf",["gesetz"],1,false,true,"","player distance rathaus <= 3 and isMayor"];
action46 = _role addaction ["Change taxes","maindialogs.sqf",["steuern"],1,false,true,"","player distance rathaus <= 3 and isMayor"];
//===================================== CONVOY CASH ===================================================
_role addaction ["Steal Police Payroll","noscript.sqf",'convoyhascash=false; publicvariable "convoyhascash"; _cash = (playersNumber west)*100000; ["money", _cash] call INV_AddInventoryItem; player groupchat format["You stole $%1!", _cash];',1,false,true,"","_driver = driver convoytruck; player distance convoytruck <= 7 and convoyhascash and isciv and (!alive _driver or isnull _driver)"];
//===================================== BUY HIDEOUT ===================================================
//_role addaction [format["Buy Hideout ($%1)", hideoutcost],"noscript.sqf",'if("money" call INV_GetItemAmount < hideoutcost)exitwith{player groupchat "not enough money"};["money", -hideoutcost] call INV_AddInventoryItem;["hideout", 1] call INV_AddInventoryItem;player groupchat format["you bought a hideout for $%1", hideoutcost];',1,false,true,"","player distance rathaus <= 3 and isciv"];
//===================================== BUY INSURANCE ===================================================
action47 = _role addaction [format["Buy bank insurance ($%1)", ("bankversicherung" call INV_GetItemBuyCost)],"noscript.sqf",'if("money" call INV_GetItemAmount < ("bankversicherung" call INV_GetItemBuyCost))exitwith{player groupchat "not enough money"};if(buybi)exitwith{player groupchat "already buying insurance"};buybi = true;["money", -("bankversicherung" call INV_GetItemBuyCost)] call INV_AddInventoryItem;sleep 3;["bankversicherung", 1] call INV_AddInventoryItem;player groupchat format["you bought bank insurance for $%1", ("bankversicherung" call INV_GetItemBuyCost)];buybi = false;',1,false,true,"","(!buybi and (player distance mainbank <= 3 or player distance copbank <= 3 or player distance atm5 <= 3 or player distance licenseflag5 <= 3 or player distance licenseflag6 <= 3 or player distance storage <= 7 or player distance atmins <= 3))"];
//======================================= CRIMELOG ====================================================
action48 = _role addaction ["Crime Log","maindialogs.sqf",["coplog"],1,false,true,"","player distance rathaus <= 3"];
//======================================== SLAVES =====================================================
action49 = _role addaction [format ["Buy Slave ($%1)", slave_cost],"slaves.sqf", ["slave"],1,false,true,"","!currecciv and player distance slaveflag <= 10 and isciv"];
//==================================== PRIVATE STORAGE ================================================
action50 = _role addaction ["Private storage","storage.sqf",["private_storage", "save"],1,false,true,"","player distance storage < 7"];
storage1 = _role addaction ["Private storage","storage.sqf",["private_storage", "save"],1,false,true,"","player distance copbank < 7"];
storage2 = _role addaction ["Private storage","storage.sqf",["private_storage", "save"],1,false,true,"","player distance pmcatm < 7"];
storage3 = _role addaction ["Private storage","storage.sqf",["private_storage", "save"],1,false,true,"","player distance atmins < 7"];
storage4 = _role addaction ["Private storage","storage.sqf",["private_storage", "save"],1,false,true,"","player distance atm5 < 7"];
//========================================= BAIL ======================================================
action51 = _role addaction [format ["Pay Bail", slave_cost],"maindialogs.sqf", ["bail"],1,false,true,"","player distance bailflag <= 5 and isciv"];
//===================================== ITEM PROCESS ==================================================
action52 = _role addaction ["Process Diamond rock","itemprocess.sqf",["Diamond rock", "Diamondring", 12, "diamond"],1,false,true,"","player distance Diamond_1 <= 5 and isciv"];
action53 = _role addaction ["Process Oil","itemprocess.sqf",["Oil", "OilBarrel", 10, "oil"],1,false,true,"","player distance Oil_1 <= 5 and isciv"];
action54 = _role addaction ["Make Glass","itemprocess.sqf",["Sand", "Glass", 2, "glassblowing"],1,false,true,"","player distance Glassblower <= 5 and isciv"];
//action54 = _role addaction ["Process Wheat","itemprocess.sqf",["getreide", "Bread", 2, "Baker"],1,false,true,"","player distance Bakery_1 <= 5 and isciv"];
//ga1
action55 = _role addaction ["Process LSD","itemprocess.sqf",["Unprocessed_LSD", "lsd", 5, "lsd ga1"],1,false,true,"","_control = gangarea1 getvariable ""control"";!isnil ""_control"" and player distance gangarea1 <= 5 and (_control == (call INV_MyGang))"];
action56 = _role addaction ["Process Cocaine","itemprocess.sqf",["Unprocessed_Cocaine", "cocaine", 5, "cocaine ga1"],1,false,true,"","_control = gangarea1 getvariable ""control"";!isnil ""_control"" and player distance gangarea1 <= 5 and (_control == (call INV_MyGang))"];
//ga2
action57 = _role addaction ["Process LSD","itemprocess.sqf",["Unprocessed_LSD", "lsd", 5, "lsd ga2"],1,false,true,"","_control = gangarea2 getvariable ""control"";!isnil ""_control"" and player distance gangarea2 <= 5 and (_control == (call INV_MyGang))"];
action58 = _role addaction ["Process Heroin","itemprocess.sqf",["Unprocessed_Heroin", "heroin", 5, "heroin ga2"],1,false,true,"","_control = gangarea2 getvariable ""control"";!isnil ""_control"" and player distance gangarea2 <= 5 and (_control == (call INV_MyGang))"];
//ga3
action59 = _role addaction ["Process Heroin","itemprocess.sqf",["Unprocessed_Heroin", "heroin", 5, "heroin ga3"],1,false,true,"","_control = gangarea3 getvariable ""control"";!isnil ""_control"" and player distance gangarea3 <= 5 and (_control == (call INV_MyGang))"];
action60 = _role addaction ["Process Marijuana","itemprocess.sqf",["Unprocessed_Marijuana", "marijuana", 5, "marijuana ga3"],1,false,true,"","_control = gangarea3 getvariable ""control"";!isnil ""_control"" and player distance gangarea3 <= 5 and (_control == (call INV_MyGang))"];
//======================================== WORKERS =====================================================
//_role addaction [format ["Hire a worker ($%1)", huren_cost],"worker.sqf", ["holen"],1,false,true,"","(player distance workplace_getjobflag_1 <= 5 or player distance workplace_getjobflag_2 <= 5 or player distance workplace_getjobflag_3 <= 5) and isciv"];
//======================================= WORKPLACE ====================================================
action61 = _role addaction ["Get courier job","delivery.sqf", ["getajob_delivery"],1,false,true,"","(player distance workplace_getjobflag_1 <= 5 or player distance workplace_getjobflag_2 <= 5 or player distance workplace_getjobflag_3 <= 5) and isciv"];
action62 = _role addaction ["Cancel delivery mission","delivery.sqf", ["cancel"],1,false,true,"","(player distance workplace_getjobflag_1 <= 5 or player distance workplace_getjobflag_2 <= 5 or player distance workplace_getjobflag_3 <= 5) and isciv and alreadygotaworkplacejob == 1"];
action63 = _role addaction ["Get taxi job","taxi.sqf", ["getajob_taxi"],1,false,true,"","(player distance workplace_getjobflag_1 <= 7 or player distance workplace_getjobflag_2 <= 7 or player distance workplace_getjobflag_3 <= 7) and isciv"];
action64 = _role addaction ["Finish taxi mission","taxi.sqf", ["canceljob_taxi"],1,false,true,"","(player distance workplace_getjobflag_1 <= 5 or player distance workplace_getjobflag_2 <= 5 or player distance workplace_getjobflag_3 <= 5) and isciv and workplacejob_taxi_active"];
action65 = _role addaction [format [localize "STRS_addAction_buy_shop", (BuyAbleBuildingsArray select 0) select 1, (BuyAbleBuildingsArray select 0) select 3],"buyshop.sqf", ["property", 0],1,false,true,"","player distance ((BuyAbleBuildingsArray select 0) select 2) <= 5 and !(((BuyAbleBuildingsArray select 0) select 0) in BuildingsOwnerArray)"];
action66 = _role addaction [format [localize "STRS_addAction_buy_shop", (BuyAbleBuildingsArray select 1) select 1, (BuyAbleBuildingsArray select 1) select 3],"buyshop.sqf", ["property", 1],1,false,true,"","player distance ((BuyAbleBuildingsArray select 1) select 2) <= 5 and !(((BuyAbleBuildingsArray select 1) select 0) in BuildingsOwnerArray)"];
action67 = _role addaction [format [localize "STRS_addAction_buy_shop", (BuyAbleBuildingsArray select 2) select 1, (BuyAbleBuildingsArray select 2) select 3],"buyshop.sqf", ["property", 2],1,false,true,"","player distance ((BuyAbleBuildingsArray select 2) select 2) <= 5 and !(((BuyAbleBuildingsArray select 2) select 0) in BuildingsOwnerArray)"];
//====================================== VEHICLE ACTIONS ================================================
action68 = _role addaction [localize "STRS_addaction_trunk_see","noscript.sqf",'_vcl = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0);_str = format["%1_storage", _vcl];[_str] call A_SCRIPT_VEHICLECHECK;',1,true,true,"",'_vcl = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0);player distance _vcl < 10 and !(_vcl in INV_VehicleArray) and ([_vcl] call INV_IsPlayerVehicle) and iscop or isopf'];
action69 = _role addaction [localize "STRS_addaction_trunk_check","noscript.sqf",'_vcl = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0);_str = format["%1_storage", _vcl];if([_vcl,_str] call INV_RemoveIllegalStorage)then{call compile format["publicvariable ""%1"";", _str]};',1,true,true,"",'_vcl = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0);player distance _vcl < 10 and !(_vcl in INV_VehicleArray) and ([_vcl] call INV_IsPlayerVehicle) and iscop or isopf'];
action70 = _role addaction ["Impound vehicle","noscript.sqf",'_vcl = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0);[_vcl, "impound"] call A_SCRIPT_IMPOUND;',1,true,true,"",'_vcl = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0);player distance _vcl < 10 and ([_vcl] call INV_IsPlayerVehicle) and iscop or isopf'];
action71 = _role addaction ["Pull out","noscript.sqf",'(nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0) execVM "pullout.sqf";',1,true,true,"",'_vcl = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0);player distance _vcl < 10 and count (crew _vcl) > 0 and ([_vcl] call INV_IsPlayerVehicle) and (call INV_IsArmed)'];
action72 = _role addaction [localize "STRS_addAction_vehicleinfo","noscript.sqf",'(nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0) call A_SCRIPT_VEHINFO;',1,true,true,"",'_vcl = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0);player distance _vcl < 10 and ([_vcl] call INV_IsPlayerVehicle)'];
//action50 = _role addaction ["Private storage","dragInto.sqf",'',1, true, true, "","player distance storage < 7"];
//======================================== GANG FLAGS ===================================================
action73 = _role addaction ["Neutralise flag","gangflags.sqf",[gangarea1, "neutralise"],1,false,true,"",'_control = gangarea1 getvariable "control";if(isnil "_control")then{_control = ""};player distance gangarea1 <= 8 and _control != (call INV_MyGang) and _control != "" and gangmember and !pickingup'];
action74 = _role addaction ["Neutralise flag","gangflags.sqf",[gangarea2, "neutralise"],1,false,true,"",'_control = gangarea2 getvariable "control";if(isnil "_control")then{_control = ""};player distance gangarea2 <= 8 and _control != (call INV_MyGang) and _control != "" and gangmember and !pickingup'];
action75 = _role addaction ["Neutralise flag","gangflags.sqf",[gangarea3, "neutralise"],1,false,true,"",'_control = gangarea3 getvariable "control";if(isnil "_control")then{_control = ""};player distance gangarea3 <= 8 and _control != (call INV_MyGang) and _control != "" and gangmember and !pickingup'];
action76 = _role addaction ["Capture flag","gangflags.sqf",[gangarea1, "capture"],1,false,true,"",'_control = gangarea1 getvariable "control";player distance gangarea1 <= 10 and isnil "_control" and gangmember and !pickingup'];
action77 = _role addaction ["Capture flag","gangflags.sqf",[gangarea2, "capture"],1,false,true,"",'_control = gangarea2 getvariable "control";player distance gangarea2 <= 10 and isnil "_control" and gangmember and !pickingup'];
action78 = _role addaction ["Capture flag","gangflags.sqf",[gangarea3, "capture"],1,false,true,"",'_control = gangarea3 getvariable "control";player distance gangarea3 <= 10 and isnil "_control" and gangmember and !pickingup'];
//======================================== SHOP EXPORT ==================================================
action79 = _role addaction ["Shop 1 export","noscript.sqf","[(shop1 call INV_GetShopNum)] call shop_open_dialog;",1,false,true,"","player distance shop1export <= 3"];
action80 = _role addaction ["Shop 2 export","noscript.sqf","[(shop2 call INV_GetShopNum)] call shop_open_dialog;",1,false,true,"","player distance shop2export <= 3"];
action81 = _role addaction ["Shop 3 export","noscript.sqf","[(shop3 call INV_GetShopNum)] call shop_open_dialog;",1,false,true,"","player distance shop3export <= 3"];
action82 = _role addaction ["Shop 4 export","noscript.sqf","[(shop4 call INV_GetShopNum)] call shop_open_dialog;",1,false,true,"","player distance shop4export <= 3"];
//======================================= GANG GUNSHOPS ==================================================
action83 = _role addaction ["Gang Shop", "noscript.sqf", 
                            "[(gangarea1 call INV_GetShopNum)-3] call shop_open_dialog;", 
			    1, false,true,"",
			    "_control = gangarea1 getvariable ""control"";!isnil ""_control"" and player distance gangarea1 <= 5 and (_control == (call INV_MyGang))"];
							
action84 = _role addaction ["Gang Shop", "noscript.sqf", 
                            "[(gangarea2 call INV_GetShopNum)-3] call shop_open_dialog;", 
			    1, false,true,"",
			    "_control = gangarea2 getvariable ""control"";!isnil ""_control"" and player distance gangarea2 <= 5 and (_control == (call INV_MyGang))"];
							
action85 = _role addaction ["Gang Shop", "noscript.sqf", 
                            "[(gangarea3 call INV_GetShopNum)-3] call shop_open_dialog;", 
			    1, false,true,"",
			    "_control = gangarea3 getvariable ""control"";!isnil ""_control"" and player distance gangarea3 <= 5 and (_control == (call INV_MyGang))"];
//===================================== Gas station Robbing===============================================
gsshop1 = fuelshop1 addaction ["Rob Gas Station 1","robthestations.sqf",["station 1"],1,false,true,"","isciv and station1money >= 25000"];
gsshop2 = fuelshop2 addaction ["Rob Gas Station 2","robthestations.sqf",["station 2"],1,false,true,"","isciv and station2money >= 25000"];
gsshop3 = fuelshop3 addaction ["Rob Gas Station 3","robthestations.sqf",["station 3"],1,false,true,"","isciv and station3money >= 25000"];
gsshop4 = fuelshop4 addaction ["Rob Gas Station 4","robthestations.sqf",["station 4"],1,false,true,"","isciv and station4money >= 25000"];
gsshop5 = fuelshop5 addaction ["Rob Gas Station 5","robthestations.sqf",["station 5"],1,false,true,"","isciv and station5money >= 25000"];
gsshop6 = fuelshop6 addaction ["Rob Gas Station 6","robthestations.sqf",["station 6"],1,false,true,"","isciv and station6money >= 25000"];
gsshop7 = fuelshop7 addaction ["Rob Gas Station 7","robthestations.sqf",["station 7"],1,false,true,"","isciv and station7money >= 25000"];
gsshop8 = fuelshop8 addaction ["Rob Gas Station 8","robthestations.sqf",["station 8"],1,false,true,"","isciv and station8money >= 25000"];
gsshop9 = fuelshop9 addaction ["Rob Gas Station 9","robthestations.sqf",["station 9"],1,false,true,"","isciv and station9money >= 25000"];
//========================   unflip vehicle     ================================
action86 = _role addaction ["Unflip vehicle","unflipvehicle.sqf",["unflip"],1,false,true,"",'_vcl = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0);player distance _vcl < 5 and _vcl in INV_VehicleArray'];
//=========================    Cop Patrol actions   ==============================
action87 = _role addaction["Get patrol mission","coppatrol.sqf",["start"],1,false,true,"","iscop and player distance copbank <= 4 and !pmissionactive and !patrolwaittime"];
action88 = _role addaction["Cancel patrol mission","coppatrol.sqf",["end"],1,false,true,"","iscop and pmissionactive and player distance copbank <= 4"];
//========================   HOSTAGE  ================================================
action89 = _role addaction ["Take Hostage Mission","hostage.sqf",["getajob_hostage"],1,false,true,"","player distance hostage <= 3 and isciv"];
action90 = _role addaction ["Take Hostage", "noscript.sqf", "[hostage1] join (group player); player groupchat ""Keep the hostage close or you will fail!"";",1,false,true,"","player distance hostage1 < 5 and isciv"];
//=======================   Road Gates ==============================================

action94 = _role addaction ["Raise Gates","rgate2.sqf",[],1,false,true,"","iscop and player distance copgate2 <= 5"];
action95 = _role addaction ["Lower Gates","lgate2.sqf",[],1,false,true,"","iscop and player distance copgate2 <= 5"];
action96 = _role addaction ["Raise Gates","rgate3.sqf",[],1,false,true,"","iscop and player distance copgate3 <= 5"];
action97 = _role addaction ["Lower Gates","lgate3.sqf",[],1,false,true,"","iscop and player distance copgate3 <= 5"];
action98 = _role addaction ["Raise Gates","rgate4.sqf",[],1,false,true,"","iscop and player distance copgate4 <= 5"];
action99 = _role addaction ["Lower Gates","lgate4.sqf",[],1,false,true,"","iscop and player distance copgate4 <= 5"];
action100 = _role addaction ["Lower Gates","lgate5.sqf",[],1,false,true,"","ispmc and player distance pmcgate <= 5 or (""pmc_license_journeyman"" call INV_HasLicense) and player distance pmcgate <= 5"];
action101 = _role addaction ["Lower Gates","lgate6.sqf",[],1,false,true,"","isciv and player distance terrgate <= 4"];
action102 = _role addaction ["Raise Gates","rgate5.sqf",[],1,false,true,"","isins and player distance opforgate2 <= 5"];
action103 = _role addaction ["Lower Gates","lgate8.sqf",[],1,false,true,"","isins and player distance opforgate2 <= 5"];
action104 = _role addaction ["Raise Gates","rgate6.sqf",[],1,false,true,"","isopf and player distance opforgate1 <= 5"];
action105 = _role addaction ["Lower Gates","lgate9.sqf",[],1,false,true,"","isopf and player distance opforgate1 <= 5"];
action106 = _role addaction ["Raise Gates","rgate7.sqf",[],1,false,true,"","isopf and player distance opforgate3 <= 5"];
action107 = _role addaction ["Lower Gates","lgate10.sqf",[],1,false,true,"","isopf and player distance opforgate3 <= 5"];
action108 = _role addaction ["Lower Gates","lgate11.sqf",[],1,false,true,"","isopf and player distance opforgateb <= 5"];
action109 = _role addaction ["Lower Gates","lgate12.sqf",[],1,false,true,"","player distance medgate1 <= 4 and (""paramedic_license"" call INV_HasLicense)"];
action110 = _role addaction ["Lower Gates","lgate12.sqf",[],1,false,true,"","player distance medgate2 <= 4 and (""paramedic_license"" call INV_HasLicense)"];

//==========================================DRAGGING===============================================
//action114 = _role addaction ["Drag Person","drag.sqf",[(nearestobjects [_posFind,["Man"], 1] - [player]) select 0, player],1, true, true, "",'_ply = (nearestobjects [_posFind,["Man"], 1] - [player]) select 0; player distance _ply <= 5 and animationstate _ply == "civillying01";'];
//action115 = _role addaction ["Drop Person","drag.sqf",[(nearestobjects [_posFind,["Man"], 1] - [player]) select 0, player],1, true, true, "",'_ply = (nearestobjects [_posFind,["Man"], 1] - [player]) select 0; player distance _ply <= 5 and _ply getVariable "Escorting";'];

action114 = _role addaction ["Drag Person","drag.sqf",[player],1, true, true, "",'_ply = cursorTarget; player distance _ply <= 5 and isPlayer _ply and animationstate _ply == "civillying01"'];
action115 = _role addaction ["Drop Person","undrag.sqf",[player],1, true, true, "",'isPlayer draggedPerson'];
action116 = _role addaction ["Put Person In Vehicle","dragInto.sqf",[],1, true, true, "",'_veh = (nearestobjects [getPosATL player, ["Air", "Ship", "LandVehicle"], 4] select 0); player distance _veh < 10 and isPlayer draggedPerson'];

A_running = false;