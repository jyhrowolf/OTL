/// @description clean up surface
if(surface_exists(surf))
	surface_free(surf);
var gc = instance_find(o_game_controller,0);
var ships = gc.player_controller.players[player].civilization.ships[class];
for(var i = 0; i < array_length(ships); i++)
{
	if(ships[i].id == self.id)
	{
		array_delete(ships,i,1);
		break;
	}
}