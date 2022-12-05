/// @description Neutron Bomb
trait = function(_system,_gc) //
{
	//destroy the population instantly
	var player = _gc.player_controller.players[_system.player];
	var planets = _system.planets;
	var destroyed = [0,0,0];
	for(var i = 0; i < array_length(planets); i++)
	{
		for(var j = 0; j < array_length(planets[i].resources); j++)
		{
			destroyed[planets.resource] ++;
		}
		array_delete(planets[i].resources,0,array_length(planets[i].resources));
	}
	for(var i = 0; i < 3; i++)
	{
		player.civilization.resources_destroyed[i] = destroyed[i];
	}
}