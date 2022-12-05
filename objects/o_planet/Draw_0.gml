/// @description Draw Planet
draw_self();
for(var i = 0; i < array_length(slots); i++)
{
	draw_sprite(s_resource_slot,slots[i], x - 5*(array_length(slots)-1) + 10*i, y + 10);
	if(array_length(resources)-i > 0)
	{
		var pc = instance_find(o_player_controller,0);
		var my_color = pc.players[resources[i]].species.faction_color;
		draw_sprite_ext(s_resource,0, x - 5*(array_length(slots)-1) + 10*i, y + 10,1,1,0,my_color,1);
	}
}