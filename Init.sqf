#include "Zen_FrameworkFunctions\Zen_InitHeader.sqf"

// Resgate impossivel by Toaster[BTS]
// Version = 0.1

enableSaving [false, false];


// Cria o briefing
player creatediaryRecord["Diary", ["Execução", "Intercept and destroy a convoy resupplying the radar site.<br/>The radar site may be guarded by one squad.<br/>"]];
player creatediaryRecord["Diary", ["Missão", "Intercept and destroy a convoy resupplying the radar site.<br/>The radar site may be guarded by one squad.<br/>"]];
player creatediaryRecord["Diary", ["Situação", "Intercept and destroy a convoy resupplying the radar site.<br/>The radar site may be guarded by one squad.<br/>"]];


//execVM "Intro.sqf";


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
_MARKERALPHA("nango_01");
_MARKERALPHA("nango_02");
_MARKERALPHA("nango_03");
_MARKERALPHA("nango_04");

////////////////////////////////////////////////




//////////////// METODOS /////////////////////////
f_checkBTSposition = {
	private ["_squad","_objective","_distance"];

	_squadUnit = _this select 0;
	_squadObjective = _this select 1;
	_squadDistance = _this select 2;

	_squadCenter = _squadUnit call Zen_FindAveragePosition;

	_result = ([_squadCenter, _squadObjective] call Zen_Find2dDistance) < _squadDistance;
	
	(_result)
};

////////////////////////////////////////////////














// Cacheia os grupos para performance
_BTSalpha = group alpha;
_BTSbravo = group bravo;


// DEBUG
_charlie = group charlie;
arrayDEBUG = units _charlie;


// Coloca todas unidades em um array para uso posterior
todosPlayersArray = units _BTSalpha + units _BTSbravo;
alphaPlayersarray = units _BTSalpha;
bravoPlayersarray = units _BTSbravo;





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

   [arrayDEBUG, "BTSpousoAlpha", 100] call f_checkBTSposition;
};
hint "DROP!";
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

	_squadCenter = todosPlayersArray call Zen_FindAveragePosition;

	(([_todosPlayersArray, "BTSroadblock"] call Zen_Find2dDistance) < 400)
	};


	_evento01 = [ "BTSroadblock", east, "Infantry", 3, "Men", "Marv_IS"] call Zen_SpawnInfantry;
	0 = [_evento01, "sof"] call Zen_SetAISkill;
	
};



// EVENTO 02: Roubo do Suprimento
0 = [] spawn {
	// Apaga a caixa se o player sair do raio de 1000 metros
	waitUntil {	
	sleep 2;
	(([_todosPlayersArray, "BTSpousoAlpha"] call Zen_Find2dDistance) > 1000)
	};


	deleteVehicle BTSsupplyDrop;
};


// EVENTO 03: Too Many, so few
0 = [] spawn {

	waitUntil {	
	sleep 2;
	
	(([_todosPlayersArray, "BTSroadblock"] call Zen_Find2dDistance) < 500)
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
	 	(([_todosPlayersArray, "nango_01"] call Zen_Find2dDistance) < 800)
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

