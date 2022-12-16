/// @description Exploration
var gc = instance_find(o_game_controller, 0);
var current_player = players[active_player];
if(action == 0)
{
	action = 1;
	if(current_player.last_selected_hex != noone) // center camera on last selected hex
	{
		var hex = current_player.last_selected_hex;
		var c_width = camera_get_view_width(view_camera[0]); 
		var c_height = camera_get_view_height(view_camera[0]);
		camera_set_view_pos(view_camera[0],hex.x-c_width/2,hex.y-c_height/2);
	}
	// spend influence
	current_player.civilization.influence_spent[0]++;
	current_player.civilization.influence--;
	current_player.calculate_influence_upkeep(0);
	
	var applied_traits = current_player.civilization.trait_list;
	applied_traits = calculate_applied_traits(applied_traits,"pirate_explore");
	if(array_length(applied_traits) != 0)
	{
		current_player.pirate = 1;
	}
	
}
else if(action == 1)
{
	if(gc.busy == 0) // do not explore
	{
		if(action_taken) 
		{
			gc.complete--;
			if(gc.complete <= 0) // go to free
			{
				action = 0;
				bottom_bar.my_buttons[6].image_index = 0; //reset cancel button, to end
			}
		}
		else // go to free and refund influence
		{
			current_player.civilization.influence_spent[0]--;
			current_player.civilization.influence++;
			current_player.calculate_influence_upkeep(0);
			action = 0;
			gc.complete = 0;
			bottom_bar.my_buttons[6].image_index = 2; //reset cancel button, to pass, no action taken
		}
	}
	else if (gc.busy == 1) // do not place/discard
	{
		var system = instance_create_layer(gc.selected_hex.x, gc.selected_hex.y,
					"Map", o_system);
		var hex = gc.selected_hex.hex_coord;
		system.hex_coord = hex
		system.tier = tier_calculate(hex);
		system.depth = system.tier;
		
		var tie = system.tier*(system.tier<4) + 3*(system.tier>=4);
		var st = object_get_name(gc.map[? map_hash(hex)].object_index);
		var s = string_char_at(st,string_length(st)-2);
		s += string_char_at(st,string_length(st)-1);
		s += string_char_at(st,string_length(st));
		array_insert(gc.system_tokens[tie-1],0,s);
		
		instance_destroy(gc.map[? map_hash(hex)])
		gc.map[? map_hash(hex)] = system;
		gc.hovered_hex = system;
		gc.selected_hex = system;
		rotate_camera(self,0,gc.selected_hex);
		
		var applied_traits = current_player.civilization.trait_list;
		applied_traits = calculate_applied_traits(applied_traits,"pirate_explore");
		var pirate = 0;
		if(array_length(applied_traits) != 0)
		{
			pirate = current_player.pirate--;
		}
		
		if(gc.complete <= 0 && pirate == 0) // go to free
		{
			action = 0;
			gc.busy = 0;
			bottom_bar.my_buttons[6].image_index = 0; //reset cancel button, to end
		}
		else
		{
			gc.busy = 0;
		}
		
		bottom_bar.alarm[0] = 1; // update buttons
		gc.alarm[1] = 1; // refresh map
	}
	else if (gc.busy == 2) // do not colonize
	{
		if(gc.complete <= 0) // go to free
		{
			action = 0;
			bottom_bar.my_buttons[6].image_index = 0; //reset cancel button, to end
		}
		else
		{
			gc.busy = 0;
		}
		bottom_bar.alarm[0] = 1;
	}
}