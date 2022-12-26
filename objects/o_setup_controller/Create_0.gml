/// @description Create
randomize();
global.mouse_state = 0;
cursor = instance_create_depth(0,0,-100,o_cursor);
cursor.image_xscale = 2;
cursor.image_yscale = 2;
window_set_cursor(cr_none);

for(var i = 0; i < instance_number(o_setup_attribute); i++)
{
	array_push(attributes,instance_find(o_setup_attribute,i));
}
for(var i = 0; i < instance_number(o_setup_button); i++)
{
	array_push(buttons,instance_find(o_setup_button,i));
}
attributes_bounds = [	[2,9], // player count
						[0,6], // tech count 1-8
						[0,6],
						[0,6],
						[0,6],
						[0,6],
						[0,6],
						[0,6],
						[0,6],
						[1,7], // player species
						[1,7],
						[1,7],
						[1,7],
						[1,7],
						[1,7],
						[1,7],
						[1,7],
						[1,7],
						[1,16]  // number of rounds
						];