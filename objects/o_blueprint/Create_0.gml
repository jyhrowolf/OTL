/// @description Settup functions
/*
case 0:"Hull";
case 1:"Drive";
case 2:"Source";
case 3:"Computer";
case 4:"Shots";
case 5:"Missiles";
case 6:"Shields";
case 7:"Initiative";
*/
for(var i = 0; i < slots; i++)
{
	ship_parts[i] = noone;
}

calculate_blueprint = function()
{
	initiative = 0;
	hull = 1;
	drive = 0;
	source = 0;
	computer = 0;
	weapons = [0,0,0,0,0];
	missiles = [0,0,0,0,0];
	shield = 0;
	for(var i = 0; i < array_length(ship_parts); i++)
	{
		if(ship_parts[i] != noone)
			for(var p = 0; p < array_length(ship_parts[i].equipment); p++)
			{
				switch (ship_parts[i].equipment[p][0])
				{
					case 0: // hull
						hull += ship_parts[i].equipment[p][1];
					break;
					case 1: // initiatve
						drive += ship_parts[i].equipment[p][1];
					break;
					case 2: // initiatve
						source += ship_parts[i].equipment[p][1];
					break;
					case 3: // initiatve
						computer += ship_parts[i].equipment[p][1];
					break;
					case 4: // weapons
						weapons[ship_parts[i].equipment[p][2]] += ship_parts[i].equipment[p][1];
					break;
					case 5: // missile
						missiles[ship_parts[i].equipment[p][2]] += ship_parts[i].equipment[p][1];
					break;
					case 6: // initiatve
						shield += ship_parts[i].equipment[p][1];
					break;
					case 7: // initiatve
						initiative += ship_parts[i].equipment[p][1];
					break;
				}
			}
	}
	
	for(var i = 0; i < array_length(design_parts); i++)
	{
		for(var p = 0; p < array_length(design_parts[i].equipment); p++)
		{
			switch (design_parts[i].equipment[p][0])
			{
				
				case 0: // hull
					hull += design_parts[i].equipment[p][1];
				break;
				case 1: // initiatve
					drive += design_parts[i].equipment[p][1];
				break;
				case 2: // initiatve
					source += design_parts[i].equipment[p][1];
				break;
				case 3: // initiatve
					computer += design_parts[i].equipment[p][1];
				break;
				case 4: // weapons
					weapons[ship_parts[i].equipment[p][2]] += ship_parts[i].equipment[p][1];
				break;
				case 5: // missile
					missiles[ship_parts[i].equipment[p][2]] += ship_parts[i].equipment[p][1];
				break;
				case 6: // initiatve
					shield += design_parts[i].equipment[p][1];
				break;
				case 7: // initiatve
					initiative += design_parts[i].equipment[p][1];
				break;
			}
		}
	}
	
	for(var i = 0; i < array_length(innate_parts); i++)
	{
		switch (innate_parts[i][0])
		{
			case 0: // hull
				hull += innate_parts[i][1];
			break;
			case 1: // initiatve
				drive += innate_parts[i][1];
			break;
			case 2: // initiatve
				source += innate_parts[i][1];
			break;
			case 3: // initiatve
				computer += innate_parts[i][1];
			break;
			case 4: // weapons
			case 5: // missile
			break;
			case 6: // initiatve
				shield += innate_parts[i][1];
			break;
			case 7: // initiatve
				initiative += innate_parts[i][1];
			break;
		}
	}
}

add_ship_part = function(_ship_part,index)
{
	if(ship_parts[index] != noone)
		instance_destroy(ship_parts[index]);
	var sp = instance_create_layer(0,0,"Controllers",_ship_part);
	array_set(ship_parts,index,sp);
	calculate_blueprint();
}

add_rare_ship_part = function(_ship_part,index)
{
	if(ship_parts[index] != noone)
		instance_destroy(ship_parts[index]);
	array_set(ship_parts,index,_ship_part);
	calculate_blueprint();
}

add_design_part = function(_design_part)
{
	array_push(design_parts,_design_part);
	calculate_blueprint();
}

add_innate_part = function(_innate_part)
{
	array_push(innate_parts,_innate_part);
	calculate_blueprint();
}

display_to_blueprint = function(_display)
{
	for(var i = 0; i < array_length(ship_parts); i++)
		instance_destroy(ship_parts[i]);
	ship_parts = [];
	for(var i = 0; i < array_length(_display.ship_parts); i++)
		array_push(ship_parts,noone);
	for(var i = 0; i < array_length(_display.ship_parts); i++)
		if(_display.ship_parts[i] != noone)
		{
			if(_display.ship_parts[i].rare == -1)
			{
				var s = object_get_name(_display.ship_parts[i].object_index);
				add_ship_part(asset_get_index(s),i);
			}
			else
				add_rare_ship_part(_display.ship_parts[i],i);
		}
	
	design_parts = _display.design_parts;
		
	calculate_blueprint();
	update_ship_display();
	var s = string_digits(object_get_name(self.object_index));
	if(string_length(s) > 2)
		s = string_copy(s,2,2);
	for(var i = 0; i < instance_number(asset_get_index("o_ship_"+string(s))); i++)
	{
		var ship = instance_find(asset_get_index("o_ship_"+string(s)),i);
		if(ship.player == player)
		{
			ship.update_blueprint();
		}
	}
}

update_ship_display = function()
{
	ship_display = [-1,-1,-1,-1,-1,-1,-1,-1];
	for(var i = 0; i < array_length(ship_parts); i++)
	{
		if(ship_parts[i] != noone)
		{
			var max_part = 0;
			for(var p = 0; p < array_length(ship_parts[i].equipment); p++)
			{
				if(ship_parts[i].equipment[p][0] != 4 && ship_parts[i].equipment[p][0] != 5)
				{
					max_part = max(ship_parts[i].equipment[p][1],max_part);
					ship_display[ship_parts[i].equipment[p][0]] = max_part;
				}
			}
		}
	}
}
roll_six = function(computer)
{
	var roll = irandom_range(0,5);
	if(roll == 0)
		return 0;
	return roll + computer
}

roll_missiles = function()
{
	var attacks = [];
	for(var d = 1; d < array_length(missiles); d++)
	{
		for(var m = 0; m < missiles[d]; m++)
		{
			array_push(attacks,[d,roll_six(computer)]);
		}
	}
	show_debug_message("Missiles rolled: " + string(attacks));
	return attacks;
}

roll_weapons = function()
{
	var attacks = [];
	for(var d = 1; d < array_length(weapons); d++)
	{
		for(var w = 0; w < weapons[d]; w++)
		{
			array_push(attacks,[d,roll_six(computer)]);
		}
	}
	show_debug_message("Weapons rolled: " + string(attacks));
	return attacks;
}

has_missiles = function()
{
	for(var d = 1; d < array_length(missiles); d++)
	{
		if(missiles[d] > 0)
			return true;
	}
	return false;
}

has_weapons = function()
{
	for(var d = 1; d < array_length(weapons); d++)
	{
		if(weapons[d] > 0)
			return true;
	}
	return false;
}