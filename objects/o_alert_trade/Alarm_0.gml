/// @description Yes button
var trade_resources = [0,0];
for(var i = 0; i < 3; i++)
{
	if(my_buttons[i].highlighted == 1)
		trade_resources[0] = i;
	else if(my_buttons[i].highlighted == 2)
		trade_resources[1] = i;
}
if(current_player.civilization.resources[trade_resources[1]] - trade >= 0) // if trade is valid
{
	current_player.civilization.calculate_resource(trade_resources[1],-trade);
	current_player.civilization.calculate_resource(trade_resources[0],1);
}