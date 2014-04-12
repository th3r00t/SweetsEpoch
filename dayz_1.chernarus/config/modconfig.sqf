/***********************************************************************************************
								SURVIVAL SERVERS CUSTOM MOD CONFIG
								  -Add Mods Here
************************************************************************************************/
[] execvm 'SDS\sds_SafeZoneCommander.sqf';

// gear access on surrendered player
		if(_isMan and !_isZombie and !_isAnimal) then {
			_isSurrendered = _cursorTarget getVariable ["DZE_Surrendered",false];
			if (_isSurrendered) then {
				_player_SurrenderedGear = true;
			};
		};
	};
		//CLOTHES
    if (_isMan and !_isAlive and !_isZombie and !_isAnimal) then {
    if (s_clothes < 0) then {
            s_clothes = player addAction [("<t color=""#FF0000"">" + ("Take Clothes") + "</t>"), "fixes\clothes.sqf",cursorTarget, 1, false, true, "",""];
        };
    } else {
        player removeAction s_clothes;
        s_clothes = -1;
    };
	player removeAction s_clothes;
    s_clothes = -1;