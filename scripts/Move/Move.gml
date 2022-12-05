// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function action_move(_gc,_pc, selected_hex, choose_hex)
{
	var c_width = camera_get_view_width(view_camera[0]);
	var c_height = camera_get_view_height(view_camera[0]);
	var current_player = _pc.players[_pc.active_player];
	
	camera_set_view_pos(view_camera[0],choose_hex.x-c_width/2,choose_hex.y-c_height/2);
	if(_gc.busy == 0)
	{
		if(is_player_ship(current_player.player,choose_hex,true))
		{
			var ac = instance_find(o_alert_controller,0);
			show_debug_message("MOVE");
			if(_pc.action >= 0) // trigger move alert
			{
				array_push(ac.alerts,o_alert_choose_ship);
				ac.next_alert(choose_hex);
			}
		}
	}
	else if(_gc.busy >= 1)
	{
		if(choose_hex.highlighted)
		{
			if(!_pc.action_taken)
			{
				_pc.action_taken = true;
				_gc.bottom_bar.alarm[0] = 1;
			}
						
			for(var i = array_length(selected_hex.ships)-1; i >= 0; i--)
			{
				var ship = selected_hex.ships[i];
				if(ship.player == current_player.player)
					if(ship.class + 1 == _gc.busy)
					{
						array_delete(selected_hex.ships,i,1);
						array_push(choose_hex.ships,ship);
						ship.target = choose_hex;
						break;
					}
			}
			_gc.complete--;
			_gc.busy = 0;
			alarm[5] = 1;
			if(_gc.complete <= 0)
			{
				_pc.alarm[5] = 1;
				alarm[11] = 1;
			}
		}
	}
}