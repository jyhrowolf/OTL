/// @description clean up surface
if(surface_exists(surf))
	surface_free(surf);
var gc = instance_find(o_game_controller,0);
var ships = gc.player_controller.players[player].civilization.ships[class];
array_remove(ships,self);
var explo = instance_create_depth(x,y,depth,o_explosion_1);
explo.image_blend = my_color;
var plus = 1;
if(player == 0)
{
	plus = 2;
}
explo.image_xscale = class+plus;
explo.image_yscale = class+plus;