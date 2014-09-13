// This file is part of Zenophon's ArmA 3 Co-op Mission Framework
// This file is released under Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)
// See Legal.txt

_Zen_stack_Trace = ["Zen_AddLoadoutDialog", _this] call Zen_StackAdd;
private ["_objects", "_kits", "_maxUses", "_sendPacket", "_id"];

if !([_this, [["ARRAY", "OBJECT"], ["ARRAY"], ["SCALAR"], ["BOOL"]], [["OBJECT"], ["STRING"]], 2] call Zen_CheckArguments) exitWith {
    call Zen_StackRemove;
};

_objects = _this select 0;
_kits = _this select 1;

_maxUses = -1;
_sendPacket = true;

if (count _this > 2) then {
    _maxUses = _this select 2;
} else {
    _this set [2, -1];
};

if (count _this > 3) then {
    _sendPacket = _this select 3;
} else {
    _this set [3, false];
};

if (typeName _objects != "ARRAY") then {
    _objects = [_objects];
};

if (!isDedicated && hasInterface) then {
    {
        _id = _x addAction ["<t color='#2D8CE0'>Select Loadout</t>", Zen_ShowLoadoutDialog, _kits, 1, false, true, "", "(alive _target && {((_target distance _this) < (1 + (((boundingBoxReal _target) select 0) distance ((boundingBoxReal _target) select 1)) / 2))})"];
        Zen_Loadout_Action_Array_Local pushBack [_id, _maxUses, 0];
    } forEach _objects;
};

if (isMultiplayer && {_sendPacket}) then {
    Zen_MP_Closure_Packet = ["Zen_AddLoadoutDialog", _this];
    publicVariable "Zen_MP_Closure_Packet";
};

call Zen_StackRemove;
if (true) exitWith {};
