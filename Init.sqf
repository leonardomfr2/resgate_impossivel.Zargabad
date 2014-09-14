#include "Zen_FrameworkFunctions\Zen_InitHeader.sqf"

// Resgate impossivel by Toaster[BTS]
// Version = 0.1

enableSaving [false, false];


// Cria o briefing
player creatediaryRecord["Diary", ["Execução", "Intercept and destroy a convoy resupplying the radar site.<br/>The radar site may be guarded by one squad.<br/>"]];
player creatediaryRecord["Diary", ["Missão", "Intercept and destroy a convoy resupplying the radar site.<br/>The radar site may be guarded by one squad.<br/>"]];
player creatediaryRecord["Diary", ["Situação", "Intercept and destroy a convoy resupplying the radar site.<br/>The radar site may be guarded by one squad.<br/>"]];


execVM "Intro.sqf";


// Executa o SQUAD MANAGER
 _Functions = []ExecVM "BTS\joinerUI\GroupMonitor.sqf";
 waitUntil {ScriptDone _Functions};
 Player AddEventHandler ["Respawn", {_menu = (_this select 0) addAction ["<t color=""#3399FF"">" +"Gerenciador de Pelotões", "BTS\joinerUI\showJoiner.sqf","",-98,false,false]}];
 _menu = player addAction ["<t color=""#3399FF"">" +"Gerenciador de Pelotões", "BTS\joinerUI\showJoiner.sqf","",-98,false,false];





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

////////////////////////////////////////////////
















// Cacheia os grupos para performance
_BTSalpha = group alpha;
_BTSbravo = group bravo;

// Cria os helicopteros
_alphaHeli = ["heli_alpha", "B_Heli_Transport_01_F", 40] call Zen_SpawnHelicopter;
_bravoHeli = ["heli_bravo", "B_Heli_Transport_01_F", 40] call Zen_SpawnHelicopter;

// Manda os helis pro LimaZulu
0 = [_alphaHeli, ["BTSpousoAlpha", "heli_alpha"], _BTSalpha, "normal", 40] spawn Zen_OrderInsertion;
0 = [_bravoHeli, ["BTSpousoBravo", "heli_bravo"], _BTSalpha, "normal", 40] spawn Zen_OrderInsertion;

// Coloca os squads nos helis
0 = [_BTSalpha, _alphaHeli] call Zen_MoveInVehicle;
0 = [_BTSbravo, _bravoHeli] call Zen_MoveInVehicle;


// Espera o esquadrao chegar a menos de 10 metros pra soltar o supply
waitUntil {
    sleep 2;
	(([_alphaHeli, "BTSpousoAlpha"] call Zen_Find2dDistance) < 100 || ([_bravoHeli, "BTSpousoBravo"] call Zen_Find2dDistance) < 100)
};
[BTSsupplyDrop] call Zen_SpawnParachute;









////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////  PLAYERS JA NO SOLO A PARTIR DESTA LINHA //////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



















////////////////////////////////////////////////////////////////////////////////////
//=/=/=/=/=/=/=/=/=/=/=/=/=/ INICIO EVENTOS ALEATORIOS //=/=/=/=/=/=/=/=/=/=/=/=/=/
//////////////////////////////////////////////////////////////////////////////////


// EVENTO 01: Massacre de Civis
0 = [] spawn {

	waitUntil {	
	sleep 2;
	(([Player, "BTSroadblock"] call Zen_Find2dDistance) < 200)
	};


	_evento01 = [ "BTSroadblock", east, "Infantry", 3, "Hezbollah", "Hezbollah"] call Zen_SpawnInfantry;
	0 = [_evento01, "sof"] call Zen_SetAISkill;
	
};



// EVENTO 02: Roubo do Suprimento
0 = [] spawn {
	// Apaga a caixa se o player sair do raio de 1000 metros
	waitUntil {	
	sleep 2;
	(([Player, "BTSpousoAlpha"] call Zen_Find2dDistance) > 1000)
	};


	deleteVehicle BTSsupplyDrop;
};


// EVENTO 03: Too Many, so few
0 = [] spawn {

	waitUntil {	
	sleep 2;
	//(([Player, "BTSroadblock"] call Zen_Find2dDistance) < 200)
	(([Player, "BTSroadblock"] call Zen_Find2dDistance) < 100)
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
_spwAzizayt_01 = [ "azizayt_01", east, "Infantry", 8, "Hezbollah", "Hezbollah"] call Zen_SpawnInfantry;
_spwAzizayt_02 = [ "azizayt_02", east, "Infantry", 8, "Hezbollah", "Hezbollah"] call Zen_SpawnInfantry;
_spwAzizayt_03 = [ "azizayt_03", east, "Infantry", 8, "Hezbollah", "Hezbollah"] call Zen_SpawnInfantry;
_spwAzizayt_04 = [ "azizayt_04", east, "Infantry", 6, "Hezbollah", "Hezbollah"] call Zen_SpawnInfantryGarrison;

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







// 0 = [] spawn {
//         waitUntil {
//             sleep 2;
//             (([_BTSalpha, "BTSpousoAlpha"] call Zen_Find2dDistance) < 50)
//         };

//        	[BTSsupplyDrop] call Zen_SpawnParachute;
//        	hint "chute!"

//         // {
//         //     deleteVehicle _x;
//         // } forEach (crew (_this select 0) + [(_this select 0)]);
//     };
