/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

exploration_reward = function(_civilization)
{
	var pc = instance_find(o_player_controller,0);
	var gc = instance_find(o_game_controller,0);
	
	var hex = pc.players[pc.active_player].last_selected_hex;
	
	if(gc.combat_hex != noone && array_length(gc.combat_initiative) > 0)
		hex = gc.combat_hex;
	
	var s = string_digits(object_get_name(pc.players[pc.active_player].blueprints[1].object_index));
	if(string_length(s) > 2)
		s = string_copy(s,2,2);
	var ship = instance_create_layer(hex.x,hex.y,"Player",asset_get_index("o_ship_" + string(s)));
	ship.player = pc.active_player;
	ship.update_color();
	ship.ship_path_start(ship.path_speed,false);

	array_push(hex.ships, ship);
	array_push(pc.players[pc.active_player].civilization.ships[1], ship);
}