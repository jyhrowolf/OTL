/// @description clean up surface
if(surface_exists(surf))
	surface_free(surf);
var gc = instance_find(o_game_controller,0);
var ships = gc.player_controller.players[player].civilization.ships[class];
var boo = array_remove(ships,self);
show_debug_message(boo);