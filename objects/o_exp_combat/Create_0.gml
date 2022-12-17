/// @description 1-4 vp
event_inherited();

combat_reward = function()
{
	var gc = instance_find(o_game_controller,0);
	var tokens = gc.reputation_tokens;
	victory_points = array_pop(tokens);
}