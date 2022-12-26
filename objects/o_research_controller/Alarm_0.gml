/// @description Draw new Tiles
var rare_dc = true;
var amount = draw_research
if(initial_draw_research != 0)
{
	rare_dc = false
	amount = initial_draw_research
}
for(var i = 0; i < amount; i++)
{
	var token = array_pop(research_tokens);
	var index = real(string_char_at(token,1));
	
	if(index == 3 && array_length(available_research[3]) == 7) // rare is full
	{
		array_insert(research_tokens,0,token);
	}
	else
		array_push(available_research[index],token);
	
	if(index == 3 && !rare_dc) // its rare dont count on initial
		i--;
}
if(!rare_dc)
	initial_draw_research = 0;
for(var i = 0; i < 4; i++)
{
	array_sort(available_research[i],function(elm1, elm2)
    {
        return elm1 - elm2;
    });
}