/// @description Create
/*
at[0]		player count
at[1-2]		tech draw
at[3-11]	tech count
at[12-17]	player species
at[18-41]	exploration tokens
at[42-54]	system system_tokens
*/
randomise();
var setup = instance_find(o_setup_controller, 0);
var i = 0;
attributes[i++] = setup.attributes[0].attribute_value; //player count
attributes[i++] = 12 + 2 * (attributes[0] - 2); // research initial draw count
attributes[i++] = 5 + (attributes[0] - 2); // research initial draw count
var research_index = i;
for(var i = research_index-2; i < array_length(setup.attributes)-6; i++)
{
	attributes[i+2] = setup.attributes[i].attribute_value;
}
attributes[i+2] = 15; // rare research

var species_index = i+3; // player specie
for(var i = species_index -3; i < array_length(setup.attributes); i++)
{
	attributes[i+3] = setup.attributes[i].attribute_value;
}

var sum = 0;
var research_tokens = [];
var temp = [];
for(var i = research_index; i < species_index-1; i++)
{
	sum += 3*attributes[i];
	temp[3*(i-research_index)] = attributes[i]; // 0 is mil
	temp[3*(i-research_index)+1] = attributes[i]; // 1 is grid
	temp[3*(i-research_index)+2] = attributes[i]; // 2 is nano
}
sum += attributes[i--];
for(var r = i*3; r < i*3+attributes[i+1]; r++)
{
	temp[r] = 1;
}

while(sum > 0)
{
	var index = irandom_range(0,sum-1);
	var sml_sum = 0;
	for(var in = 0; in < array_length(temp); in++)
	{
		sml_sum += temp[in];
		if(index < sml_sum)
		{
			index = in;
			break;
		}
	}
	temp[index] -= 1;
	var s = "";
	if(index >= array_length(temp)-15) // its a reare research
		s = string(300 + (index - (array_length(temp) - 15)));
	else // its not
		s = string(index % 3) + string(index div 3);
	array_push(research_tokens, string(s));
	sum--;
}
i+= 8
/*array_sort(research_tokens,function(elm1, elm2)
    {
        return elm1 - elm2;
    });*/


var tokens = ["o_exp_ma", "o_exp_sc", "o_exp_mo", "o_exp_ma_sc_mo",
				"o_exp_tech", "o_exp_cruiser", "o_exp_orbital", "o_exp_monolith",
				"o_exp_warp_gate", "o_exp_ship_part"];
var exploration_index = i;
// exploration tokens
attributes[i++] = 3;	// resources
attributes[i++] = 3;
attributes[i++] = 3;
attributes[i++] = 2;
attributes[i++] = 3;	// tech
attributes[i++] = 3;	// cruiser
attributes[i++] = 2;	// orbital
attributes[i++] = 1;	// monolith
attributes[i++] = 1;	// warp gate
for(var in = i; in < i+15; in++)
	attributes[in] = 1;	// ship parts

var sum = 0;
temp = [];
for(var i = exploration_index; i < array_length(attributes); i++)
{
	sum += attributes[i];
	temp[i-exploration_index] = attributes[i];
}
while(sum > 0)
{
	var index = irandom_range(0,sum-1);
	var sml_sum = 0;
	for(var in = 0; in < array_length(temp); in++)
	{
		sml_sum += temp[in];
		if(index < sml_sum)
		{
			index = in;
			break;
		}
	}
	temp[index] -= 1;
	var s = "";
	if(index > 8) // its ship parts
	{
		s += "_";
		if(index - 9  < 10)
			s += "0";
		s += string(index - 9);
		index = 9;
	}
	array_push(exploration_tokens, string(tokens[index]) + s);
	sum--;
}

var tier_bounds = [10,13,20];
var tier_dif = [[],[12,13],[19,20]];
var tier_special = [[],[14,81],[81,82]];
var tier_index = i;
attributes[i++] = tier_bounds[0];	// system system_tokens t-1
attributes[i++] = tier_bounds[1];	// t-2

var t_3 = 0;
switch (attributes[0])
{
	case 6:
		t_3 += 2;
	case 5:
		t_3 += 2;
	case 4:
		t_3 += 4;
	case 3:
		t_3 += 3;
	case 2:
		t_3 += 5;
}
attributes[i++] = t_3;	// t-3

var tiles = ds_map_create();
for(var t = 0; t < 3; t++)
{
	for(var in = 0; in < attributes[tier_index + t]; in++)
	{
		var ran = irandom_range(1,tier_bounds[t]);
		while(ds_map_exists(tiles,ran))
			ran = irandom_range(1,tier_bounds[t]);
		tiles[? ran] = 1;
		var s = string(t+1);
		for(var d = 0; d < array_length(tier_dif[t]);d++)
			if(ran == tier_dif[t][d])
			{
				ran = tier_special[t][d];
				break;
			}
		
		if(ran < 10)
			s += string(0) + string(ran);
		else
			s += string(ran);

		array_push(system_tokens[t],s);
	}
	ds_map_clear(tiles);
}
ds_map_destroy(tiles);

//array_insert(exploration_tokens,array_length(exploration_tokens)-5,"o_exp_cruiser"); //exploration testing

//setup players
global.player_color[0] = #808080;	//c_grey
global.player_color[1] = #900000;	//c_maroon
global.player_color[2] = #000090;	//c_navy
global.player_color[3] = #004000;	//c_green
global.player_color[4] = #907000;	//c_yellow
global.player_color[5] = #B8B8B8;	//c_white
global.player_color[6] = #181818;	//c_dkgrey
player_controller = instance_create_layer(0,0,"Controllers",o_player_controller);

research_controller = instance_create_layer(0,0,"Controllers",o_research_controller);
research_controller.initial_draw_research = attributes[research_index-2];
research_controller.draw_research = attributes[research_index-1];
research_controller.research_tokens = research_tokens;
research_controller.alarm[0] = 1;

alarm[0] = 1;
room_goto_next();

instance_destroy(setup);