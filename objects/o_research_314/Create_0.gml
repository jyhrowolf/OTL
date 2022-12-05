/// @description Advanced Sythensis
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
	//enable Advanced Sythensis
	_civilization.buildable[0] = 1;
	_civilization.buildable[1] = 1;
	_civilization.buildable[2] = 1;
}