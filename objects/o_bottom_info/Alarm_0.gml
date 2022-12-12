/// @description Do info panel click
var pc = instance_find(o_player_controller,0);

var player = pc.players[pc.active_player];

var ifp = instance_find(o_info_panel,0);
if(instance_exists(ifp))
{
	instance_destroy(ifp);
	player.info_panel = false;
}
else
{
	ifp = instance_create_layer(0,89*3,"GUI",o_info_panel);
	ifp.image_xscale = 3;
	ifp.image_yscale = 3;
	player.info_panel = true;
}