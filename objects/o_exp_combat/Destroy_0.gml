/// @description Insert description here
// You can write your code in this editor

var gc = instance_find(o_game_controller,0);
if(instance_exists(gc))
{
	var tokens = gc.reputation_tokens;
	array_insert(tokens,irandom_range(0,array_length(tokens)-1),victory_points);
}