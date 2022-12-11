/// @description Neutron Bomb
trait = function(_system,_pc) //
{
	//destroy the population instantly
	var player = _pc.players[_system.player];
	var planets = _system.planets;
	var destroyed = [0,0,0];
	for(var i = 0; i < array_length(planets); i++)
	{
		destroyed[planets[i].resource] = planets[i].resources;
		planets[i].resources = 0;
	}
	for(var i = 0; i < 3; i++)
	{
		player.civilization.resources_destroyed[i] = destroyed[i];
	}
}