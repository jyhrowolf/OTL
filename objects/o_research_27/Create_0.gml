/// @description Artifact Key
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
	// enable Artifact key
	var artifact_bounty = 0;
	for(var i = 0; i < array_length(_civilization.systems); i++)
		if(_civilization.systems[i].artifact)
			artifact_bounty += 5;
	_civilization.calculate_resource(0,artifact_bounty);
}