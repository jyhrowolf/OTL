/// @description Draw Planet
draw_self();
for(var i = 0; i < array_length(slots);i++)
{
	draw_sprite(s_resource_slot,slots[i], x - 5*(array_length(slots)-1) + 10*i,y+10);
}