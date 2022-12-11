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
if(selected_button != -1)
{
	if(my_buttons[selected_button].upgrade.design)
	{
		if(my_buttons[selected_button].rare == -1 && variable == noone)
		{
			bp.add_design_part(my_buttons[selected_button].upgrade);
		}
		else if(my_buttons[selected_button].rare >= 0)
		{
			bp.add_design_part(my_buttons[selected_button].upgrade);
			array_delete(current_civ.upgrades[7],my_buttons[selected_button].rare,1);
			alarm[0] = 1;
		}
	}
	else if(index != -1)	// clicked on one
	{
		if(my_buttons[selected_button].rare == -1 && variable == noone)
		{
			var s = object_get_name(my_buttons[selected_button].upgrade.object_index);
			bp.add_ship_part(asset_get_index(s),index);
		}
		else if(my_buttons[selected_button].rare >= 0)
		{
			bp.add_rare_ship_part(my_buttons[selected_button].upgrade,index);
			array_delete(current_civ.upgrades[7],my_buttons[selected_button].rare,1);
			alarm[0] = 1;
		}
	}
}
else if(index != -1)
{
	bp.remove_part(index);
}
changes = 0;
for(var i = 0; i < array_length(available_blueprints); i++)
{
	changes += my_buttons[array_length(my_buttons)-3-i].changes;
}