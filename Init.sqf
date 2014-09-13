#include "Zen_FrameworkFunctions\Zen_InitHeader.sqf"

// Resgate impossivel by Toaster[BTS]
// Version = 0.1

titleText ["Boa sorte a todos!", "BLACK FADED", 0.2];
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


// Espera o esquadrao chegar a menos de 50 metros pra soltar o supply
waitUntil {
    sleep 2;
	(([_BTSalpha, "BTSpousoAlpha"] call Zen_Find2dDistance) < 50)
};
[BTSsupplyDrop] call Zen_SpawnParachute;


// Apaga a caixa se o player sair do raio de 1000 metros
0 = [] spawn {

	waitUntil {	
	sleep 2;
	(([Player, "BTSpousoAlpha"] call Zen_Find2dDistance) > 1000)
	};

	hint "Caixa apagada";
	deleteVehicle BTSsupplyDrop;
	
};


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
