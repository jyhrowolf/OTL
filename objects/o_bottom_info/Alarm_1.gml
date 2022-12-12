/// @description Do info panel no update
var ifp = instance_find(o_info_panel,0);
if(instance_exists(ifp))
{
	instance_destroy(ifp);
}
else
{
	ifp = instance_create_layer(0,89*3,"GUI",o_info_panel);
	ifp.image_xscale = 3;
	ifp.image_yscale = 3;
}