/// @description Destroy ship parts
for(var i = 0; i < array_length(ship_parts); i++)
{
	instance_destroy(ship_parts[i]);
}
array_delete(ship_parts,0,array_length(ship_parts));
ds_map_destroy(init_map);
ds_map_destroy(final_map);