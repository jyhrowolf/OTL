/// @description Quantom Grid
//class = 0, 1, 2, 3 - Millitary, Grid, Nano, Rare
//type = 0, 1, 2, 3, - Ship Part, Build, Instant, Permanent
// Inherit the parent event
event_inherited();
//hulls			- 0
//drives		- 1
//sources		- 2
//computers		- 3
//weapons		- 4
//missiles		- 5
//shields		- 6
research_trial = function(_civilization)
{
	// enable Quantom Grid
	_civilization.influence += 2;
	// calculate new upkeep
	var upk = 13 - _civilization.influence;
	if(upk < 0)
		upk = 0;
	var u = 0.215285*upk*upk - 0.0834166*upk + 0.043956;
	
	_civilization.calculate_influence_upkeep(round(u));
}