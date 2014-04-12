markPos = _this select 0;

if(isNil "markers") then { markers = []};
if (!("ItemGPS" in items player)) then {player addweapon "ItemGPS";};

//GLOBAL VARS START

GlobalSleep=1;//Sleep between update markers

//----------------------#Zombies#--------------------------
AddZombieToMap=true;
ZombieVisibleDistance=100;
ZombieMarkerType="vehicle";
ZombieMarkerColor="ColorGreen";
ZombieName="Zombie";
//----------------------#Zombies#--------------------------

//----------------------#Vehicles#-------------------------
AddVehicleToMap=true;
VehicleMarkerType="vehicle";
VehicleMarkerColor="ColorBlue";
//----------------------#Vehicles#-------------------------

//----------------------#Tents#----------------------------
AddTentsToMap=true;
TentsMarkerType="vehicle";
TentsMarkerColor="ColorYellow";
//----------------------#Tents#----------------------------

//----------------------#Crashes#--------------------------
AddCrashesToMap=true;
CrashesMarkerType="vehicle";
CrashesMarkerColor="ColorRed";
//----------------------#Crashes#--------------------------

//GLOBAL VARS END
While {markPos} do 
{
	While {visibleMap} do
	{
		If (AddZombieToMap) then {
			_pos = getPos player;
			_zombies = _pos nearEntities ["zZombie_Base",ZombieVisibleDistance];
			_zmcount= count _zombies;
			k=0;

			_markcount = count markers;
			for "k" from 0 to (_markcount -1) do
			{
				deleteMarkerLocal ("zmMarker"+ (str k));
			};

			for "k" from 0 to _zmcount do 
			{
				_text = format ["zmMarker%1", k];
				markers set [k, _text];
				zm = _zombies select k;
				if(alive zm) then 
				{
					pos = position zm;
					deleteMarkerLocal ("zmMarker"+ (str k));
					MarkerZm = "zmMarker" + (str k);
					ParamsZm=[MarkerZm,pos];
					MarkerZm = createMarkerLocal ParamsZm;
					MarkerZm setMarkerTypeLocal ZombieMarkerType;
					MarkerZm setMarkerPosLocal (pos);
					MarkerZm setMarkerColorLocal(ZombieMarkerColor);
					MarkerZm setMarkerTextLocal ZombieName;
				};
			};
		};

		If (AddVehicleToMap) then 
		{
			vehList = allmissionobjects "LandVehicle" + allmissionobjects "Air" + allmissionobjects "Boat";
			j = count vehList;
			i = 0;

			for "i" from 0 to j do
			{
				veh = vehList select i;
				_name = gettext (configFile >> "CfgVehicles" >> (typeof veh) >> "displayName");

				pos = position veh;
				deleteMarkerLocal ("vehMarker"+ (str i));
				MarkerVeh = "vehMarker" + (str i);
				ParamsVeh=[MarkerVeh,pos];
				MarkerVeh = createMarkerLocal ParamsVeh;
				MarkerVeh setMarkerTypeLocal VehicleMarkerType;
				MarkerVeh setMarkerPosLocal (pos);
				MarkerVeh setMarkerColorLocal(VehicleMarkerColor);
				MarkerVeh setMarkerTextLocal format ["%1",_name];
			};
		};

		If (AddTentsToMap) then 
		{
			tentList = allmissionobjects "Land_A_tent";
			j1 = count tentList;
			i1 = 0;

			for "i1" from 0 to j1 do
			{
				tent = tentList select i1;
				_name = gettext (configFile >> "CfgVehicles" >> (typeof tent) >> "displayName");
				pos = position tent;
				deleteMarkerLocal ("tentMarker"+ (str i1));
				MarkerTent = "tentMarker" + (str i1);
				ParamsTent=[MarkerTent,pos];
				MarkerTent = createMarkerLocal ParamsTent;
				MarkerTent setMarkerTypeLocal TentsMarkerType;
				MarkerTent setMarkerPosLocal (pos);
				MarkerTent setMarkerColorLocal(TentsMarkerColor);
				MarkerTent setMarkerTextLocal format ["%1",_name];
			};
		};
		
		If (AddCrashesToMap) then 
		{
			crashList = allmissionobjects "UH1Wreck_DZ";
			j2 = count tentList;
			i2 = 0;

			for "i2" from 0 to j2 do
			{
				crash = crashList select i2;
				_name = gettext (configFile >> "CfgVehicles" >> (typeof crash) >> "displayName");
				pos = position crash;
				deleteMarkerLocal ("crashMarker"+ (str i2));
				MarkerCrash = "crashMarker" + (str i2);
				ParamsCrash=[MarkerCrash,pos];
				MarkerCrash = createMarkerLocal ParamsCrash;
				MarkerCrash setMarkerTypeLocal CrashesMarkerType;
				MarkerCrash setMarkerPosLocal (pos);
				MarkerCrash setMarkerColorLocal(CrashesMarkerColor);
				MarkerCrash setMarkerTextLocal format ["%1",_name];
			};
		};
		sleep GlobalSleep;
		
		{
			clearGroupIcons (group _x);
		} forEach allUnits;
	};
	sleep 3;
};

if(!markPos) then 
{
	If (AddPlayersToMap) then 
	{
		{
			clearGroupIcons (group _x);
		} forEach allUnits;
	};

	If (AddZombieToMap) then 
	{
		_count = count markers;
		for "k" from 0 to (_count -1) do
		{
			deleteMarkerLocal ("zmMarker"+ (str k));
		};
	};

	If (AddVehicleToMap) then 
	{
		for "i" from 0 to j do
		{
			veh = vehList select i;
			deleteMarkerLocal ("vehMarker"+ (str i));
		};
	};

	If (AddTentsToMap) then 
	{
		for "i1" from 0 to j1 do
		{
			tent = tentList select i1;
			deleteMarkerLocal ("tentMarker"+ (str i1));
		};
	};

	If (AddCrashesToMap) then 
	{
		for "i2" from 0 to j2 do
		{
			crash = crashList select i2;
			deleteMarkerLocal ("crashMarker"+ (str i2));
		};
	};
	sleep 0.5;
};