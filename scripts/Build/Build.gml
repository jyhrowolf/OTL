// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function action_build(_gc,_pc, choose_hex)
{
	var c_width = camera_get_view_width(view_camera[0]);
	var c_height = camera_get_view_height(view_camera[0]);
	var current_player = _pc.players[_pc.active_player];
	
	if(choose_hex.player == _pc.active_player) //update player's most recent hex select
		current_player.last_selected_hex = choose_hex;
	camera_set_view_pos(view_camera[0],choose_hex.x-c_width/2,choose_hex.y-c_height/2);
	if(_gc.busy >= 1)
	{
		if(choose_hex.player == _pc.active_player)
			if(is_buildable(_gc.busy,choose_hex))
			{
				if(_gc.busy < 5) //build ship
				{
					var s = string_digits(object_get_name(current_player.blueprints[_gc.busy-1].object_index));
					if(string_length(s) > 2)
						s = string_copy(s,2,2);
					var ship = instance_create_layer(choose_hex.x,choose_hex.y,"Player",asset_get_index("o_ship_" + string(s)));
					ship.player = _pc.active_player;
					ship.update_color();
					ship.ship_path_start(ship.path_speed,(_gc.busy-1 == 3));

					array_push(choose_hex.ships,ship);
					array_push(current_player.civilization.ships[_gc.busy-1],ship);
				}
				else //build orbital monolith
				{
					var _x = choose_hex.x;
					var _y = choose_hex.y;
	
					var placements = ds_map_create();
					for(var i = 0; i < 6; i++)
					{
						if(instance_position(_x+global.hex_size*.45*cos(pi/3*i),_y+global.hex_size*.45*sin(pi/3*i),o_planet))
							placements[? i] = 1;
					}
	
					var index = irandom_range(0,5);
					while(ds_map_exists(placements,index))
						index = irandom_range(0,5);
					ds_map_destroy(placements);
	
					var p = instance_create_layer(_x+global.hex_size*.6*cos(pi/3*index),_y+global.hex_size*.6*sin(pi/3*index),"Planets",o_planet);
								
					var c = 4+2*(_gc.busy -5);
								
					if(c = 4)
						p.slots = [0];
					else
					{
						choose_hex.victory_points += 3;
						p.slots = [];
					}
					p.resource = c;
					p.image_index = c;
	
					array_push(choose_hex.planets,p);
					update_planets(choose_hex);
				}
							
				current_player.civilization.calculate_resource(2,-current_player.civilization.buildable_cost[_gc.busy-1]);
				if(!_pc.action_taken)
				{
					_pc.action_taken = true;
					_gc.bottom_bar.alarm[0] = 1; // darken buttons
				}
				_gc.complete--;
				if(_gc.complete > 0 && current_player.civilization.resources[2] >= current_player.civilization.buildable_cost[0]) //not finished
				{
					_gc.busy = 0;
					alarm[4] = 1;
				}
				else // finish
				{
					_pc.action = 0;
					_gc.busy = 0;
					_gc.bottom_bar.my_buttons[6].image_index = 0; // button to end
								
					alarm[11] = 1;
				}
			}
	}
}