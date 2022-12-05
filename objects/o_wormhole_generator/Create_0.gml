/// @description Wormhole
trait = function(_system,_gc) //
{
	//allow travel through half connections
	var _pc = _gc.player_controller;
	//var player = _pc[_pc.active_player];
	var _map = _gc.map;
	if(_pc.action == 1) // explore
	{
			var adv = [
		    [1,0], [1,-1], [0,-1], 
		    [-1,0], [-1,1], [0,1] 
		];
	
		var old_coord = _system.hex_coord;
		for(var j = 0; j < 6; j++) // if I am adjacent to active player
		{
			var new_coord = [old_coord[0] + adv[j][0], old_coord[1] + adv[j][1]];
			if (ds_map_exists(_map, map_hash(new_coord)))
			{
				var sys = _map[? map_hash(new_coord)]
				if(sys.explored)
					if(sys.player == _pc.active_player || is_player_ship(_pc.active_player,sys,false))
						return true;
			}
		}
		return false;
	}
}