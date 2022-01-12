/// @description Create
randomize();
for(var i = 0; i < instance_number(o_setup_attribute); i++)
{
	array_push(attributes,instance_find(o_setup_attribute,i));
}
attributes_bounds = [	[2,6], // player count
						[0,6], // tech count 1-8
						[0,6],
						[0,6],
						[0,6],
						[0,6],
						[0,6],
						[0,6],
						[0,6]	];