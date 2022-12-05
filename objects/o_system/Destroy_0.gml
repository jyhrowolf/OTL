/// @description Clean up all planets and ships and belongings
for(var i = 0; i < array_length(planets); i++)
{
	instance_destroy(planets[i]);
}
for(var i = 0; i < array_length(ships); i++)
{
	instance_destroy(ships[i]);
}
var gc = instance_find(o_game_controller,0);
var s = object_get_name(exploration_token);
array_insert(gc.exploration_tokens,0,s);
instance_destroy(exploration_token);
instance_destroy(system_center);