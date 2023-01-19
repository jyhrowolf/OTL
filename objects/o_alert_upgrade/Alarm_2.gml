/// @description Drop on blueprint

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
			instance_destroy(my_buttons[selected_button]);
			array_delete(my_buttons,selected_button,1);
			
			selected_button = -1;
			selected_blueprint--;
			
			if(variable == "rare")
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
			if(bp.add_rare_ship_part(my_buttons[selected_button].upgrade,index))
			{
				array_delete(current_civ.upgrades[7],my_buttons[selected_button].rare,1);
				instance_destroy(my_buttons[selected_button]);
				array_delete(my_buttons,selected_button,1);
			
				selected_button = -1;
				selected_blueprint--;
				
				if(variable == "rare")
					alarm[0] = 1;
			}
		}
	}
}
else if(cursor.hover_asset != noone)
{
	if(index != -1)	// clicked on one
	{
		if(cursor.hover_asset.rare == -1 && variable == noone)
		{
			var s = object_get_name(cursor.hover_asset.upgrade.object_index);
			bp.add_ship_part(asset_get_index(s),index);
		}
		else if(cursor.hover_asset.rare >= 0)
		{
			if(bp.add_rare_ship_part(cursor.hover_asset.upgrade,index))
			{
				instance_destroy(cursor.hover_asset);
				cursor.hover_asset = noone;
			}
		}
	}
	else
	{
		instance_destroy(cursor.hover_asset);
		cursor.hover_asset = noone;
	}
}

ds_map_clear(final_map);
for(var i = array_length(my_buttons) - 2 - 4; i < array_length(my_buttons) - 2; i++)
{
	var bp = my_buttons[i];
	var keys = [];
	ds_map_keys_to_array(bp.final_map,keys);
	for(var k = 0; k < array_length(keys); k++)
	{
		var val = bp.final_map[? keys[k]];
		if(ds_map_exists(final_map, keys[k]))
			final_map[? keys[k]] += val;
		else
			final_map[? keys[k]] = val;
	}
}

changes = 0;
var list = [];
ds_map_keys_to_array(final_map, list);
for (var i = 0; i < array_length(list); i++) 
{
	if(ds_map_exists(init_map,list[i]))
	{
		var ad = final_map[?list[i]] - init_map[?list[i]];
		changes += ad*(ad>0);
	}
	else
	{
		changes += final_map[?list[i]];
	}
}

cursor.hover_sprite = noone;
cursor.hover_index = 0;
cursor.hover_offset = [0,0];
selected_button = -1;