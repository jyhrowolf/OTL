/// @description Handle rotation
var change = 1;
var pc = player_controller;
if(pc.action >= 0 && global.mouse_state < 1) //interact with map
{
	switch (pc.action)
	{
		case 1: //explore
			var applied_traits = player_controller.players[player_controller.active_player].civilization.trait_list;
			applied_traits = calculate_applied_traits(applied_traits,"explore");
			if(busy == 0)
			{
				rotate_camera(pc,change,selected_hex);
			}
			else if(busy == 1)
			{
				rotate_camera(pc,0,selected_hex);
				rotate_layout(selected_hex,change);
				while(!valid_rotation(selected_hex,map,pc.active_player,array_length(applied_traits) > 0))
					rotate_layout(selected_hex,change);
			}
		break;
		default :
			rotate_camera(pc,change,selected_hex);
		break;
	}
}