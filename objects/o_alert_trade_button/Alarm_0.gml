/// @description Get clicked
var last_highlighted = alert_trade.last_highlighted;
var indexes = [0,0,0];
for(var i = 0; i < 3; i++)
{
	indexes[alert_trade.my_buttons[i].highlighted] = i;
}
var next_highlighted = 1;

next_highlighted = 2*!(last_highlighted-1 == 1)+(last_highlighted-1 == 1);
if(highlighted == next_highlighted)
	next_highlighted = 2*(last_highlighted-1 == 1)+!(last_highlighted-1 == 1);

alert_trade.my_buttons[indexes[next_highlighted]].update_depth(highlighted);

alert_trade.my_buttons[indexes[highlighted]].update_depth(next_highlighted);

alert_trade.last_highlighted = next_highlighted;