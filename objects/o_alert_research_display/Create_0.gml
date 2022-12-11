/// @description Create Function
depth = -16;
generate_research = function(_research)
{
	research = instance_create_layer(0,0,"GUI",asset_get_index("o_research_"+string(_research)));
	research_name = research.research_name;
	class = research.class;
	type = research.type;
	cost = research.cost;
	discount = research.discount;
	sprite_index = asset_get_index("s_alert_research_tokens_"+string(class));
	var index = real(_research);
	if(index >= 300)
	{
		image_index = index % 100;
	}
	else
	{
		image_index = index % 10;
		x += (21 * image_index)*3;
	}
	
}
text_color = [];
text_color[0] = #e65abe;
text_color[1] = #5ae6a0;
text_color[2] = #c5e65a;
text_color[3] = #3f4a55;