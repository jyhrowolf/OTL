/// @description Insert description here
// You can write your code in this editor

var gc = instance_find(o_game_controller,0);
if(instance_exists(gc))
{
	array_insert(gc.reputation_tokens,irandom_range(0,array_length(gc.reputation_tokens)),victory_points);
}