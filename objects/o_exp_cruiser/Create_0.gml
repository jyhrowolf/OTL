/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

exploration_reward = function(_civilization)
{
	var pc = instance_find(o_player_controller,0);
	
	var hex = pc.players[pc.active_player].last_selected_hex;
	if(gc.combat_hex != noone)
		hex = gc.combat_hex;
	
	var ship = instance_create_layer(hex.x,hex.y,"Player",o_ship_61);
	ship.player = pc.active_player;
	ship.update_color();

	array_push(hex.ships, ship);
	array_push(pc.players[pc.active_player].civilization.ships[1], ship);
}