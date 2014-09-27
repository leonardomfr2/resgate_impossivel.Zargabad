#include "Zen_FrameworkFunctions\Zen_InitHeader.sqf"

// Resgate impossivel by Toaster[BTS]
// Version = 0.1

enableSaving [false, false];


// Cria o briefing
player creatediaryRecord["Diary", ["Execução", "Intercept and destroy a convoy resupplying the radar site.<br/>The radar site may be guarded by one squad.<br/>"]];
player creatediaryRecord["Diary", ["Missão", "Intercept and destroy a convoy resupplying the radar site.<br/>The radar site may be guarded by one squad.<br/>"]];
player creatediaryRecord["Diary", ["Situação", "Intercept and destroy a convoy resupplying the radar site.<br/>The radar site may be guarded by one squad.<br/>"]];


//execVM "Intro.sqf";








// Desabilita o lixo do thermal image
0 = [] spawn {

	_layer = 85125; 
	while {true} do 
	{ 
		if (currentVisionMode player == 2) then
			{ 
			  	//hint "Porcaria de thermal";
				_layer	cutText ["ERR 0921F - No battery or insufficient memory","BLACK",-3];
				waituntil {currentVisionMode player != 2};
				_layer cutText ["", "PLAIN"];
			};
			sleep 0.5; 
	};
};





/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////// CLIENT SIDE PARA NESTA LINHA  /////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if (!isServer) exitWith {};
sleep 1;


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////// SERVER SIDE A PARTIR DESTA LINHA  /////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////




//////////////// MACROS /////////////////////////

// Apaga os maracdores do mapa
#define _MARKERALPHA(ARG1) ARG1 setMarkerAlpha 0;
_MARKERALPHA("azizayt_01");
_MARKERALPHA("azizayt_02");
_MARKERALPHA("azizayt_03");
_MARKERALPHA("azizayt_04");
_MARKERALPHA("BTSroadblock");
_MARKERALPHA("nango_01");
_MARKERALPHA("nango_02");
_MARKERALPHA("nango_03");
_MARKERALPHA("nango_04");

_MARKERALPHA("v");
_MARKERALPHA("v_01");
_MARKERALPHA("v_2");
_MARKERALPHA("v_3");
_MARKERALPHA("v_4");
_MARKERALPHA("v_5");
_MARKERALPHA("h");
_MARKERALPHA("h_1");

_MARKERALPHA("b");
_MARKERALPHA("b1");
_MARKERALPHA("b2");
_MARKERALPHA("b3");
_MARKERALPHA("b4");
_MARKERALPHA("b5");
_MARKERALPHA("b6");




////////////////////////////////////////////////






////////////////////////////////////////////////







if (isServer) then {call compile preprocessFile "Scripts\initBuildings.sqf";};


// Coloca AGM nos carros de policia
clearMagazineCargoGlobal police01;
clearWeaponCargoGlobal police01;
clearItemCargoGlobal police01;
clearBackpackCargoGlobal police01;


police01 additemCargoGlobal ["AGM_EarBuds", 4];
police01 additemCargoGlobal ["AGM_Bandage", 40];
police01 additemCargoGlobal ["AGM_Morphine", 18];
police01 additemCargoGlobal ["AGM_Epipen", 13];
police01 additemCargoGlobal ["AGM_Bloodbag", 7];


clearMagazineCargoGlobal police02;
clearWeaponCargoGlobal police02;
clearItemCargoGlobal police02;
clearBackpackCargoGlobal police02;

police02 additemCargoGlobal ["AGM_Clacker", 1];
police02 additemCargoGlobal ["AGM_DefusalKit", 1];
police02 additemCargoGlobal ["AGM_EarBuds", 4];
police02 additemCargoGlobal ["AGM_MapTools", 1];
police02 additemCargoGlobal ["AGM_SpareBarrel", 3];
police02 additemCargoGlobal ["AGM_ItemKestrel", 1];

// Limpa carro isis
clearMagazineCargoGlobal carisis;
clearWeaponCargoGlobal carisis;
clearItemCargoGlobal carisis;
clearBackpackCargoGlobal carisis;

clearMagazineCargoGlobal carisis02;
clearWeaponCargoGlobal carisis02;
clearItemCargoGlobal carisis02;
clearBackpackCargoGlobal carisis02;

clearMagazineCargoGlobal carisis03;
clearWeaponCargoGlobal carisis03;
clearItemCargoGlobal carisis03;
clearBackpackCargoGlobal carisis03;

clearMagazineCargoGlobal carisis04;
clearWeaponCargoGlobal carisis04;
clearItemCargoGlobal carisis04;
clearBackpackCargoGlobal carisis04;



// Cacheia os grupos para performance
BTSalpha = group alpha;
BTSbravo = group bravo;




// Coloca todas unidades em um array para uso posterior
todosPlayersArray = units BTSalpha + units BTSbravo;
alphaPlayersarray = units BTSalpha;
bravoPlayersarray = units BTSbravo;





// Cria os helicopteros
_alphaHeli = ["heli_alpha", "B_Heli_Transport_01_F", 40] call Zen_SpawnHelicopter;
_bravoHeli = ["heli_bravo", "B_Heli_Transport_01_F", 40] call Zen_SpawnHelicopter;

// Manda os helis pro LimaZulu
0 = [_alphaHeli, ["BTSpousoAlpha", "heli_alpha"], BTSalpha, "normal", 40] spawn Zen_OrderInsertion;
0 = [_bravoHeli, ["BTSpousoBravo", "heli_bravo"], BTSalpha, "normal", 40] spawn Zen_OrderInsertion;

// Coloca os squads nos helis
0 = [BTSalpha, _alphaHeli] call Zen_MoveInVehicle;
0 = [BTSbravo, _bravoHeli] call Zen_MoveInVehicle;
["btsInfo",["Envio de suprimentos autorizado na inserção."]] call BIS_fnc_showNotification;


//Espera o esquadrao chegar a menos de 10 metros pra soltar o supply
// waitUntil {
//     sleep 2;

//   (([BTSalpha, "BTSroadblock"] call Zen_Find2dDistance) < 100 || ([BTSbravo, "BTSroadblock"] call Zen_Find2dDistance) < 100)
// };
["btsInfo",["Suprimento enviado! ETA 30s."]] call BIS_fnc_showNotification;
[BTSsupplyDrop] call Zen_SpawnParachute;









////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////  PLAYERS JA NO SOLO A PARTIR DESTA LINHA //////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





// TASKS
_task01 = [[BTSalpha,BTSbravo], "A localização do jornalista é uma base desativada de Azyzayt. Elimine os sequestradores e traga o jornalista para o ponto de extração.", "Encontre o jornalista", "azizayt_aleatorio", true] call Zen_InvokeTask;













////////////////////////////////////////////////////////////////////////////////////
//=/=/=/=/=/=/=/=/=/=/=/=/=/ INICIO EVENTOS ALEATORIOS //=/=/=/=/=/=/=/=/=/=/=/=/=/
//////////////////////////////////////////////////////////////////////////////////


// EVENTO 01: Massacre de Civis
0 = [] spawn {

	waitUntil {	
	sleep 2;

	(([BTSalpha, "BTSroadblock"] call Zen_Find2dDistance) < 500 || ([BTSbravo, "BTSroadblock"] call Zen_Find2dDistance) < 500)

	};


	_evento01 = [ "BTSroadblock", east, "Infantry", 3, "Men", "Marv_IS"] call Zen_SpawnInfantry;
	0 = [_evento01, "sof"] call Zen_SetAISkill;
	
};



// EVENTO 02: Roubo do Suprimento
// 0 = [] spawn {
// 	// Apaga a caixa se o player sair do raio de 1000 metros
// 	waitUntil {	
// 		sleep 2;
	
// 		(([BTSalpha, "BTSpousoAlpha"] call Zen_Find2dDistance) > 1000 || ([BTSbravo, "BTSpousoBravo"] call Zen_Find2dDistance) > 1000)
// 	};


// 	deleteVehicle BTSsupplyDrop;
// };


// EVENTO 03: Too Many, so few
0 = [] spawn {

	waitUntil {	
		sleep 2;
		(([BTSalpha, "BTSroadblock"] call Zen_Find2dDistance) < 500 || ([BTSbravo, "BTSroadblock"] call Zen_Find2dDistance) < 500)
	};


	_evento03 = ["BTSconvoy", east, 0] call Zen_SpawnConvoy;
	{
		[_x, "BTSroadblock"] call Zen_OrderVehicleMove;
	} forEach _evento03;
	
	
};


////////////////////////////////////////////////////////////////////////////////////
//=/=/=/=/=/=/=/=/=/=/=/=/=/ FINAL EVENTOS ALEATORIOS //=/=/=/=/=/=/=/=/=/=/=/=/=/
//////////////////////////////////////////////////////////////////////////////////
















// Popula a base de Azizayt
_spwAzizayt_01 = [ "azizayt_01", east, "Infantry", 8, "Men", "Marv_IS"] call Zen_SpawnInfantry;
_spwAzizayt_02 = [ "azizayt_02", east, "Infantry", 8, "Men", "Marv_IS"] call Zen_SpawnInfantry;
_spwAzizayt_03 = [ "azizayt_03", east, "Infantry", 8, "Men", "Marv_IS"] call Zen_SpawnInfantry;
_spwAzizayt_04 = [ "azizayt_04", east, "Infantry", 6, "Men", "Marv_IS"] call Zen_SpawnInfantryGarrison;

0 = [_spwAzizayt_01, "azizayt_01"] spawn Zen_OrderInfantryPatrol;
0 = [_spwAzizayt_02, "azizayt_02"] spawn Zen_OrderInfantryPatrol;
0 = [_spwAzizayt_03, "azizayt_03"] spawn Zen_OrderInfantryPatrol;

0 = [obj_azizayt_estatica_01, east] call Zen_SpawnVehicleCrew;
0 = [obj_azizayt_estatica_02, east] call Zen_SpawnVehicleCrew;
0 = [obj_azizayt_estatica_03, east] call Zen_SpawnVehicleCrew;
0 = [obj_azizayt_estatica_04, east] call Zen_SpawnVehicleCrew;
0 = [obj_azizayt_estatica_05, east] call Zen_SpawnVehicleCrew;
0 = [obj_azizayt_estatica_06, east] call Zen_SpawnVehicleCrew;
0 = [obj_azizayt_estatica_07, east] call Zen_SpawnVehicleCrew;
0 = [obj_azizayt_estatica_08, east] call Zen_SpawnVehicleCrew;







// Popula Nango 
0 = [] spawn { 

	waitUntil {
	    sleep 2;
	 	(([BTSalpha, "nango_03"] call Zen_Find2dDistance) < 800 || ([BTSbravo, "nango_03"] call Zen_Find2dDistance) < 800)
	 	
	 };

	_spwNango_01 = [ "nango_01", east, "Infantry", 8, "Men", "Marv_IS"] call Zen_SpawnInfantry;
	_spwNango_02 = [ "nango_02", east, "Infantry", 8, "Men", "Marv_IS"] call Zen_SpawnInfantry;
	_spwNango_03 = [ "nango_03", east, "Infantry", 8, "Men", "Marv_IS"] call Zen_SpawnInfantry;
	_spwNango_04 = [ "nango_04", east, "Infantry", 8, "Men", "Marv_IS"] call Zen_SpawnInfantry;

	_spwnCarNango01 = ["nango_01", "IS_armed"] call Zen_SpawnVehicle;
	0 = [_spwnCarNango01, east] call Zen_SpawnVehicleCrew;
	0 = [_spwnCarNango01, "nango_01"] spawn Zen_OrderVehiclePatrol;

	_spwnCarNango02 = ["nango_02", "IS_armed"] call Zen_SpawnVehicle;
	0 = [_spwnCarNango02, east] call Zen_SpawnVehicleCrew;
	0 = [_spwnCarNango02, "nango_02"] spawn Zen_OrderVehiclePatrol;

	_spwnCarNango03 = ["nango_03", "IS_armed"] call Zen_SpawnVehicle;
	0 = [_spwnCarNango03, east] call Zen_SpawnVehicleCrew;
	0 = [_spwnCarNango03, "nango_03"] spawn Zen_OrderVehiclePatrol;

	_spwnCarNango04 = ["nango_04", "IS_armed"] call Zen_SpawnVehicle;
	0 = [_spwnCarNango04, east] call Zen_SpawnVehicleCrew;
	0 = [_spwnCarNango04, "nango_04"] spawn Zen_OrderVehiclePatrol;

	0 = [_spwNango_01, "nango_01"] spawn Zen_OrderInfantryPatrol;
	0 = [_spwNango_02, "nango_02"] spawn Zen_OrderInfantryPatrol;
	0 = [_spwNango_03, "nango_03"] spawn Zen_OrderInfantryPatrol;
	0 = [_spwNango_04, "nango_04"] spawn Zen_OrderInfantryPatrol;

};





_v01 = [ "v", east, "Infantry", 1, "Men", "Marv_IS"] call Zen_SpawnInfantryGarrison;
_v02 = [ "v_1", east, "Infantry", 1, "Men", "Marv_IS"] call Zen_SpawnInfantryGarrison;
_v03 = [ "v_2", east, "Infantry", 1, "Men", "Marv_IS"] call Zen_SpawnInfantryGarrison;
_v04 = [ "v_3", east, "Infantry", 1, "Men", "Marv_IS"] call Zen_SpawnInfantryGarrison;
_v05 = [ "v_4", east, "Infantry", 1, "Men", "Marv_IS"] call Zen_SpawnInfantryGarrison;
_v06 = [ "v_5", east, "Infantry", 1, "Men", "Marv_IS"] call Zen_SpawnInfantryGarrison;

_h = [ "h", east, "Infantry", 30, "Men", "Marv_IS"] call Zen_SpawnInfantryGarrison;
_h_1 = [ "h_1", east, "Infantry", 8, "Men", "Marv_IS"] call Zen_SpawnInfantryGarrison;

0 = [s1, east] call Zen_SpawnVehicleCrew;
0 = [s2, east] call Zen_SpawnVehicleCrew;
0 = [s3, east] call Zen_SpawnVehicleCrew;
0 = [s4, east] call Zen_SpawnVehicleCrew;
0 = [s5, east] call Zen_SpawnVehicleCrew;
0 = [s6, east] call Zen_SpawnVehicleCrew;


_b01 = [ "b", east, "Infantry", 15, "Men", "Marv_IS"] call Zen_SpawnInfantryGarrison;
_b02 = [ "b1", east, "Infantry", 20, "Men", "Marv_IS"] call Zen_SpawnInfantryGarrison;
_b03 = [ "b2", east, "Infantry", 20, "Men", "Marv_IS"] call Zen_SpawnInfantryGarrison;
_b04 = [ "b3", east, "Infantry", 5, "Men", "Marv_IS"] call Zen_SpawnInfantryGarrison;
_b05 = [ "b4", east, "Infantry", 8, "Men", "Marv_IS"] call Zen_SpawnInfantryGarrison;
_b06 = [ "b5", east, "Infantry", 9, "Men", "Marv_IS"] call Zen_SpawnInfantryGarrison;
_b06 = [ "b6", east, "Infantry", 6, "Men", "Marv_IS"] call Zen_SpawnInfantryGarrison;


// Limpa carros
clearMagazineCargoGlobal patrol01;
clearWeaponCargoGlobal patrol01;
clearItemCargoGlobal patrol01;
clearBackpackCargoGlobal patrol01;

clearMagazineCargoGlobal patrol02;
clearWeaponCargoGlobal patrol02;
clearItemCargoGlobal patrol02;
clearBackpackCargoGlobal patrol02;

clearMagazineCargoGlobal patrol03;
clearWeaponCargoGlobal patrol03;
clearItemCargoGlobal patrol03;
clearBackpackCargoGlobal patrol03;

clearMagazineCargoGlobal patrol04;
clearWeaponCargoGlobal patrol04;
clearItemCargoGlobal patrol04;
clearBackpackCargoGlobal patrol04;

clearMagazineCargoGlobal patrol05;
clearWeaponCargoGlobal patrol05;
clearItemCargoGlobal patrol05;
clearBackpackCargoGlobal patrol05;

clearMagazineCargoGlobal patrol06;
clearWeaponCargoGlobal patrol06;
clearItemCargoGlobal patrol06;
clearBackpackCargoGlobal patrol06;


0 = [patrol01, "b1"] spawn Zen_OrderVehiclePatrol;
0 = [patrol02, "b5"] spawn Zen_OrderVehiclePatrol;
0 = [patrol03, "b3"] spawn Zen_OrderVehiclePatrol;
0 = [patrol04, "b4"] spawn Zen_OrderVehiclePatrol;
0 = [patrol05, "b2"] spawn Zen_OrderVehiclePatrol;
0 = [patrol06, "b6"] spawn Zen_OrderVehiclePatrol;
