/// @description Click on blueprint
var m_x = device_mouse_x_to_gui(0);
var m_y = device_mouse_y_to_gui(0);
var bp = my_buttons[selected_blueprint];
var index = -1;
for(var i = 0; i < bp.slots; i++)
{
	var _x = bp.ship_parts_pos[i][0]*3 + bp.x;
	var _y = -bp.ship_parts_pos[i][1]*3 + bp.y;
	if(m_x - _x > -14 && m_x -_x <= 14)
		if(m_y - _y > -14 && m_y -_y <= 14)
		{
			index = i;
			break;
		}
}
if(index >= 0 && variable != "rare")
{
	bp.click_part(index);
}