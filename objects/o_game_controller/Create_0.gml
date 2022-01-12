/// @description Create
var setup = instance_find(o_setup_controller, 0);
for(var i = 0; i < array_length(setup.attributes); i++)
{
	attributes[i] = setup.attributes[i].attribute_value;
}
var tokens = ["o_exp_ma", "o_exp_sc", "o_exp_mo", "o_exp_ma_sc_mo",
				"o_exp_tech", "o_exp_cruiser", "o_exp_orbital", "o_exp_monolith",
				"o_exp_ship_part", "o_exp_warp_gate"];
exploration_index = i;
// exploration tokens
attributes[i++] = 3;	// resources
attributes[i++] = 3;
attributes[i++] = 3;
attributes[i++] = 2;
attributes[i++] = 3;	// tech
attributes[i++] = 3;	// cruiser
attributes[i++] = 2;	// orbital
attributes[i++] = 1;	// monolith
attributes[i++] = 15;	// ship parts
attributes[i++] = 1;	// warp gate

var sum = 0;

for(var i = exploration_index; i < array_length(attributes); i++)
{
	sum += attributes[i];
}
while(sum > 0)
{
	var index = irandom_range(0,9);
	for(var i = 0; i < 3 && index != 8 && attributes[exploration_index + 8] > 0; i++)
		index = irandom_range(0,9);
	while(attributes[exploration_index + index] <= 0)
	{
		index++;
		if(index > 9)
			index = 0;
	}
	attributes[exploration_index + index] -= 1;
	array_push(exploration_tokens, tokens[index]);
	sum--;
}
alarm[0] = 1;
room_goto_next();
instance_destroy(setup);