/// @description plant vulnernable
trait = function() //
{
	// sucks for you
	return 2;
}

plant_bomb = function(_system,_pc) //
{
	//destroy the population instantly
	var player = _pc.players[_system.player];
	var planets = _system.planets;
	var destroyed = [0,0,0];
	for(var i = 0; i < array_length(planets); i++)
	{
		if(planets[i].resource < 3) // planet
			destroyed[planets[i].resource] += planets[i].resources;
		else if(planets[i].resource < 4) // white
		{
			if(player.civilization.resources_built[2] > 0)
				destroyed[2] += planets[i].resources;
			else if(player.civilization.resources_built[1] > 0)
				destroyed[1] += planets[i].resources;
			else
				destroyed[0] += planets[i].resources;
		}
		else if(planets[i].resource < 5) // orbital
		{
			if(player.civilization.resources_built[1] > 0)
				destroyed[1] += planets[i].resources;
			else
				destroyed[0] += planets[i].resources;
		}
		planets[i].resources = 0;
	}
	for(var i = 0; i < 3; i++)
	{
		player.civilization.resources_destroyed[i] = destroyed[i];
	}
}