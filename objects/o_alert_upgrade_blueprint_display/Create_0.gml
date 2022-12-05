/// @description Settup stuff
event_inherited();
depth = -16;
text_color = [
			#5ae681,	//hull
			#bc5ae6,	//drive
			#5ee5d3,	//source
			#e6e6e6,	//computer
			#1a1a1a,	//shields
			];
text_color_weapon = [
					#e6c85a,	//1
					#e68b5a,	//2
					#499ead,	//3
					#e65a5a,	//4
					];

settup_blueprint = function(_blueprint)
{
	ship_parts_pos = _blueprint.ship_parts_pos;
	
	for(var i = 0; i < array_length(ship_parts); i++)
		instance_destroy(ship_parts[i]);
	ship_parts = [];
	for(var i = 0; i < array_length(_blueprint.ship_parts); i++)
		array_push(ship_parts,noone);
	for(var i = 0; i < array_length(_blueprint.ship_parts); i++)
		if(_blueprint.ship_parts[i] != noone)
		{
			if(_blueprint.ship_parts[i].rare == -1)
			{
				var s = object_get_name(_blueprint.ship_parts[i].object_index);
				add_init_ship_part(asset_get_index(s),i);
			}
			else
				add_init_rare_ship_part(_blueprint.ship_parts[i],i);
		}
	
	design_parts = _blueprint.design_parts;
		
	innate_parts = _blueprint.innate_parts;
	slots = _blueprint.slots;
	ds_map_copy(final_map, init_map);
	calculate_blueprint();
	
	sprite_index = _blueprint.sprite_index;
}

valid_blueprint = function()
{
	if(source >= 0)
	{
		if(slots != 5) // not a starbase
			return (drive >= 1); // it has a drive
		else
			return (drive < 1);
	}
	return false;
}

delete_part = function(index)
{
	instance_destroy(ship_parts[index]);
	array_delete(ship_parts,index,1);
	array_insert(ship_parts,index,noone);
}

remove_part = function(index)
{
	var old_part = ship_parts[index];

	array_delete(ship_parts,index,1);
	array_insert(ship_parts,index,noone);
	calculate_blueprint();
	
	if(!valid_blueprint()) // replace with old part
	{
		array_set(ship_parts,index,old_part);
		calculate_blueprint();
	}
	else // delete old part
	{
		if(old_part != noone)
		{
			final_map_add(old_part,-1);
			instance_destroy(old_part);
		}
	}
	calculate_changes();
}

add_rare_ship_part = function(_ship_part,index)
{
	var old_part = ship_parts[index];

	array_set(ship_parts,index,_ship_part);

	calculate_blueprint();
	
	if(!valid_blueprint()) // replace with old part
	{
		delete_part(index);
		array_set(ship_parts,index,old_part);
		calculate_blueprint();
	}
	else // delete old part
	{
		if(old_part != noone)
		{
			instance_destroy(old_part);
		}
	}
}

add_ship_part = function(_ship_part,index)
{
	var old_part = ship_parts[index];

	var sp = instance_create_layer(0,0,"Controllers",_ship_part);
	array_set(ship_parts,index,sp);
	calculate_blueprint();
	
	if(!valid_blueprint()) // replace with old part
	{
		delete_part(index);
		array_set(ship_parts,index,old_part);
		calculate_blueprint();
	}
	else // delete old part
	{
		final_map_add(_ship_part,1);
		if(old_part != noone)
		{
			final_map_add(old_part,-1);
			instance_destroy(old_part);
		}
	}
	calculate_changes();
}

add_init_ship_part = function(_ship_part,index)
{	
	init_map_add(_ship_part,1);
	if(ship_parts[index] != noone)
		instance_destroy(ship_parts[index]);
	var sp = instance_create_layer(0,0,"Controllers",_ship_part);
	array_set(ship_parts,index,sp);
}

add_init_rare_ship_part = function(_ship_part,index)
{	
	if(ship_parts[index] != noone)
		instance_destroy(ship_parts[index]);
	array_set(ship_parts,index,_ship_part);
}

init_map_add = function(_ship_part,_amount)
{
	var in = real(string_digits(object_get_name(_ship_part.object_index)));
	if(ds_map_exists(init_map, in))
		init_map[? in] += _amount;
	else
		init_map[? in] = 1;
}

final_map_add = function(_ship_part,_amount)
{
	var in = real(string_digits(object_get_name(_ship_part.object_index)));
	if(ds_map_exists(final_map, in))
		final_map[? in] += _amount;
	else
		final_map[? in] = 1;
}

calculate_changes = function()
{
	changes = 0;
	var list = ds_map_keys_to_array(final_map);
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
}