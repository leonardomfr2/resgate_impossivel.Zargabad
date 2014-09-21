// This file is part of Zenophon's ArmA 3 Co-op Mission Framework
// This file is released under Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)
// See Legal.txt

#define FILL_CAR(CLASS)        if (isNull driver _vehicle) then { \
            _crewClasses pushBack CLASS; \
        }; \
        { \
            if (isNull (_vehicle turretUnit _x)) then { \
                _crewClasses pushBack CLASS; \
            }; \
        } forEach _vehicleTurrets; \

#define FILL_AIRCRAFT(PILOT_CLASS, GUNNER_CLASS)        if (isNull driver _vehicle) then { \
            _crewClasses pushBack PILOT_CLASS; \
        }; \
        { \
            if (isNull (_vehicle turretUnit _x)) then { \
                if (_forEachIndex == 0) then { \
                    _crewClasses pushBack PILOT_CLASS; \
                } else { \
                    _crewClasses pushBack GUNNER_CLASS; \
                }; \
            }; \
        } forEach _vehicleTurrets; \

_Zen_stack_Trace = ["Zen_SpawnVehicleCrew", _this] call Zen_StackAdd;
private ["_vehicle", "_crewClasses", "_crewGroup", "_vehicleConfigEntry", "_side", "_carCrewClass", "_tankCrewClass", "_heliCrewClass", "_jetCrewClass", "_heliPilotClass"];

if !([_this, [["OBJECT"], ["SIDE"]], [], 1] call Zen_CheckArguments) exitWith {
    call Zen_StackRemove;
};

_vehicle = _this select 0;

_vehicleConfigEntry = configFile >> "CfgVehicles" >> (typeOf _vehicle);
if ((toLower (getText (_vehicleConfigEntry >> "vehicleClass"))) == "autonomous") exitWith {
    createVehicleCrew _vehicle;
    call Zen_StackRemove;
    (crew _vehicle)
};

if (count _this > 1) then {
    _side = _this select 1;
} else {
    _side = [_vehicle] call Zen_GetSide;
};

_crewClasses = [];
_vehicleTurrets = [_vehicle] call Zen_GetTurretPaths;

switch (_side) do {
    case west: {
        _carCrewClass = "b_soldier_f";
        _tankCrewClass = "b_crew_f";
        _heliPilotClass = "b_helipilot_f";
        _heliCrewClass = "b_helicrew_f";
        _jetCrewClass = "b_pilot_f";
    };
    case east: {
        _carCrewClass = "IS_assault";
        _tankCrewClass = "IS_assault";
        _heliPilotClass = "IS_assault";
        _heliCrewClass = "IS_assault";
        _jetCrewClass = "IS_assault";
    };
    case resistance: {
        _carCrewClass = "i_soldier_f";
        _tankCrewClass = "i_crew_f";
        _heliPilotClass = "i_helipilot_f";
        _heliCrewClass = "i_helicrew_f";
        _jetCrewClass = "i_pilot_f";
    };
    case civilian: {
        _carCrewClass = "c_man_1";
        _tankCrewClass = "c_man_1";
        _heliPilotClass = "c_man_1";
        _heliCrewClass = "c_man_1";
        _jetCrewClass = "c_man_1";
    };
    default {
        0 = ["Zen_SpawnVehicleCrew", "Invalid side given", _this] call Zen_PrintError;
        call Zen_StackPrint;
        _carCrewClass = "";
    };
};

if (_carCrewClass == "") exitWith {
    call Zen_StackRemove;
    (grpNull)
};

switch (toLower (getText (_vehicleConfigEntry >> "vehicleClass"))) do {
    case "car": {
        FILL_CAR(_carCrewClass)
    };
    case "support": {
        FILL_CAR(_carCrewClass)
    };
    case "ship": {
        FILL_CAR(_carCrewClass)
    };
    case "submarine": {
        FILL_CAR(_carCrewClass)
    };
    case "static": {
        {
            if (isNull (_vehicle turretUnit _x)) then {
                _crewClasses pushBack _carCrewClass;
            };
        } forEach _vehicleTurrets;
    };
    case "armored": {
        FILL_CAR(_tankCrewClass)
    };
    case "air": {
        switch (toLower (getText (_vehicleConfigEntry >> "textSingular"))) do {
            case (toLower (localize "str_Zen_Heli")): {
                FILL_AIRCRAFT(_heliPilotClass, _heliCrewClass)
            };
            case (toLower (localize "str_Zen_Gunship")): {
                FILL_AIRCRAFT(_heliPilotClass, _heliCrewClass)
            };
            case (toLower (localize "str_Zen_Jet")): {
                FILL_AIRCRAFT(_jetCrewClass, _jetCrewClass)
            };
            default {
                FILL_CAR(_heliPilotClass)
                0 = ["Zen_SpawnVehicleCrew", "Vehicle is of unknown textSingular type", _this] call Zen_PrintError;
                call Zen_StackPrint;
            };
        };
    };
    default {
        FILL_CAR(_carCrewClass)
        0 = ["Zen_SpawnVehicleCrew", "Vehicle is of unknown vehicleClass type", _this] call Zen_PrintError;
        call Zen_StackPrint;
    };
};

_crewGroup = [_vehicle, _crewClasses] call Zen_SpawnGroup;
0 = [_crewGroup, "Crew"] call Zen_SetAISkill;
0 = [_crewGroup, _vehicle, "all"] call Zen_MoveInVehicle;

call Zen_StackRemove;
(_crewGroup)
