/// @description Pico Modulator
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
	// increase upgrade action by 2
	_civilization.influence_action[2] += 2;
}