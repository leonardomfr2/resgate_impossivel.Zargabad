// This file is part of Zenophon's ArmA 3 Co-op Mission Framework
// This file is released under Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)
// See Legal.txt

#define GIVE_GEAR_SINGLE(SLOT, COMMAND) _gear = [_loadout, SLOT, 0] call Zen_ArrayGetNestedValue; \
    if !(typeName _gear == typeName [] && {count _gear == 0}) then { \
        _gear = _gear select 1; \
        if !(typeName _gear == typeName [] && {count _gear == 0}) then { \
            _x COMMAND ([_gear] call Zen_ArrayGetRandom); \
        }; \
    };

#define GIVE_GEAR_SET(SLOT, COMMAND) _gear = [_loadout, SLOT, 0] call Zen_ArrayGetNestedValue; \
    if !(typeName _gear == typeName [] && {count _gear == 0}) then { \
        _gear = _gear select 1; \
        if !(typeName _gear == typeName [] && {count _gear == 0}) then { \
            { \
                _unit COMMAND ([_x] call Zen_ArrayGetRandom); \
            } forEach _gear; \
        }; \
    };

_Zen_stack_Trace = ["Zen_GiveLoadoutCustom", _this] call Zen_StackAdd;
private ["_units", "_givenLoadoutArray", "_unit", "_loadout", "_gear", "_weaponsIndex", "_gearWeapons", "_randomWeaponArrays", "_randomMagCount", "_randomMag", "_magIndex", "_weaponsList", "_weapIndex", "_weaponArray"];

if !([_this, [["VOID"], ["ARRAY", "STRING"], ["BOOL"]], [[], ["STRING"]], 2] call Zen_CheckArguments) exitWith {
    call Zen_StackRemove;
};

_units = [(_this select 0)] call Zen_ConvertToObjectArray;
_units = [_units] call Zen_ArrayRemoveNonLocal;
_givenLoadoutArray = _this select 1;

_sendPacket = true;
if (count _this > 2) then {
    _sendPacket = _this select 2;
};

{
    _unit = _x;
    _unitAnim = animationState _unit;
    removeAllWeapons _x;
    removeAllContainers _x;
    removeAllAssignedItems _x;
    removeUniform _x;
    removeBackpack _x;
    removeVest _x;
    removeGoggles _x;
    removeHeadgear _x;

    _loadout = [_givenLoadoutArray] call Zen_ArrayGetRandom;
    _loadout = [_loadout, false] call Zen_GetLoadoutData;

    if (count _loadout == 0) exitWith {
        0 = ["Zen_GiveLoadoutCustom", "Given custom loadout does not exist", _this] call Zen_PrintError;
        call Zen_StackPrint;
    };

    _loadout = _loadout select 1;

    GIVE_GEAR_SINGLE("uniform", forceAddUniform)
    GIVE_GEAR_SINGLE("vest", addVest)
    GIVE_GEAR_SINGLE("backpack", addBackpack)
    GIVE_GEAR_SINGLE("headgear", addHeadgear)
    GIVE_GEAR_SINGLE("goggles", addGoggles)

    GIVE_GEAR_SET("assignedItems", linkItem)
    GIVE_GEAR_SET("items", addItem)

    _randomWeaponArrays = [];
    _randomMagCount = 0;
    _weaponsIndex = [_loadout, "weapons", 0] call Zen_ArrayGetNestedIndex;
    if (_weaponsIndex != -1) then {
        _gearWeapons = _loadout select _weaponsIndex;
        _weaponsList = _gearWeapons select 1;
        _randomWeaponArrays = [_weaponsList, "ARRAY"] call Zen_ArrayGetType;
    } else {
        _gearWeapons = [];
        _weaponsList = [];
    };

    _gear = [_loadout, "magazines", 0] call Zen_ArrayGetNestedValue;
    if !(typeName _gear == typeName [] && {count _gear == 0}) then {
        _gear = _gear select 1;
        if !(typeName _gear == typeName [] && {count _gear == 0}) then {
            {
                if ((typeName (_x select 0)) == "ARRAY") then {

                    _randomMag = [_x] call Zen_ArrayGetRandom;
                    _magIndex = [_randomMag, _x] call Zen_ValueFindInArray;

                    if (count _randomMag > 0) then {
                        if ((typeName (_randomMag select 0)) == "ARRAY") then {
                            {
                                _unit addMagazines [(_x select 0), (_x select 1)];
                            } forEach _randomMag;
                        } else {
                            _unit addMagazines [(_randomMag select 0), (_randomMag select 1)];
                        };
                    };

                    if (count _randomWeaponArrays > _randomMagCount) then {
                        _weaponArray = _randomWeaponArrays select _randomMagCount;

                        if (count _weaponArray > _magIndex) then {
                            _unit addWeaponGlobal (_weaponArray select _magIndex);
                        };

                        _weapIndex = [_weaponArray, _weaponsList] call Zen_ValueFindInArray;
                        _weaponsList set [_weapIndex, 0];
                        _randomMagCount = _randomMagCount + 1;
                    };
                } else {
                    _unit addMagazines [(_x select 0), (_x select 1)];
                };
            } forEach _gear;
        };
    };

    _weaponsList = _weaponsList - [0];
    if !(typeName _gearWeapons == typeName [] && {count _gearWeapons == 0}) then {
        if !((typeName _weaponsList == "ARRAY") && {count _weaponsList == 0}) then {
            {
                _unit addWeaponGlobal ([_x] call Zen_ArrayGetRandom);
            } forEach _weaponsList;
        };
    };

    GIVE_GEAR_SET("primaryAttachments", addPrimaryWeaponItem)
    GIVE_GEAR_SET("secondaryAttachments", addSecondaryWeaponItem)
    GIVE_GEAR_SET("handgunAttachments", addHandgunItem)

    if (sunOrMoon == 1) then {
        _x unassignItem "NVGoggles";
    };

    _unit switchMove _unitAnim;
} forEach _units;

if (isMultiplayer && {_sendPacket}) then {
    Zen_MP_Closure_Packet = ["Zen_GiveLoadoutCustom", _this + [false]];
    publicVariable "Zen_MP_Closure_Packet";
};

call Zen_StackRemove;
if (true) exitWith {};
