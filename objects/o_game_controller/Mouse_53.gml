/// @description Mouse click
var pc = player_controller;
var current_player = pc.players[pc.active_player];

if(pc.action >= 0 && global.mouse_state < 1) //interact with map
{
	var point = [mouse_x,mouse_y];
	var hex = pixel_to_flat_hex(point,global.hex_size);
	
	if(ds_map_exists(map, map_hash(hex)))
	{
		var c_width = camera_get_view_width(view_camera[0]);
		var c_height = camera_get_view_height(view_camera[0]);
		
		var choose_hex = map[? map_hash(hex)]
		if(busy == 0) //if we are not using selected_hex
			selected_hex = choose_hex;
		switch (pc.action)
		{
			case 0: //move around map
				if(selected_hex.player == pc.active_player) //update player's most recent hex select
					current_player.last_selected_hex = selected_hex;
				camera_set_view_pos(view_camera[0],choose_hex.x-c_width/2,choose_hex.y-c_height/2);
			break;
			case 1: //explore
				action_explore(self,pc,hex,choose_hex);
			break;
			case 2: //research
				//no map interaction
			break;
			case 3: //upgrade
				//no map interaction
			break;
			case 4: //build
				action_build(self,pc,choose_hex);
			break;
			case 5: //move
				action_move(self,pc,selected_hex,choose_hex);
			break;
			case 6: //influence
				action_influence(self,pc,choose_hex);
			break;
			case 7: //colonize
				action_colony(self,pc,selected_hex);
				break;
			case 8: //combat win
				action_combat(self,pc,combat_hex);
		}
	}
}