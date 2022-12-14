/// @description update depth

reset_depth = function()
{
	depth = class-2;
}

reset_depth();

if(surface_dim[0] <= 0)
	surface_dim = [sprite_width,sprite_width];

surface_dim[0] = ceil(surface_dim[0]*1.25);
surface_dim[1] = ceil(surface_dim[1]*1.25);

surf = surface_create(surface_dim[0],surface_dim[1]);
	
update_color = function()
{
	var pc = instance_find(o_player_controller,0);
	blueprint = pc.players[player].blueprints[class];
	if(player != 0)
	{
		my_color = pc.players[player].species.faction_color;
		update_blueprint();
	}
}
update_blueprint = function()
{
	hull = blueprint.hull;
	var _c = my_color /*+ #0A0A0A*(3-class)*/;
	if(!surface_exists(surf))
		surf = surface_create(surface_dim[0],surface_dim[1]);
	
	surface_set_target(surf);
	draw_clear_alpha(c_white,0);
	var _x = surface_dim[0] div 2;
	var _y = surface_dim[1] div 2;

	draw_sprite_ext(ship_sprite,0,_x,_y,1,1,0,_c,1);
	if(class != 3)
	{
		var weap = 0;
		if(weapon_sprite != noone)
			for(var i = 0; i < array_length(blueprint.weapons); i++)
				if(blueprint.weapons[i] > 0)
					for(var w = 0; w < blueprint.weapons[i]; w++)
					{
						draw_sprite_ext(weapon_sprite, i-1,
										_x+weapon_offset[weap%array_length(weapon_offset)][0],_y-weapon_offset[weap%array_length(weapon_offset)][1],1-2*(weap%2==1),1,0,_c,1);
						weap++;
					}
		var miss = 0;
		if(missile_sprite != noone)
			for(var i = 0; i < array_length(blueprint.missiles); i++)
				if(blueprint.missiles[i] > 0)
					for(var w = 0; w < (blueprint.missiles[i]+1) div 2; w++)
					{
						draw_sprite_ext(missile_sprite, i-1,
										_x+weapon_offset[(array_length(weapon_offset)-miss-1)%array_length(weapon_offset)][0],_y-weapon_offset[(array_length(weapon_offset)-miss-1)%array_length(weapon_offset)][1],1-2*(miss%2==1),1,0,_c,1);
						miss++;
					}
	}
	else
	{
		var rot = 0;
		var weap = 0;
		if(weapon_sprite != noone)
			for(var i = 0; i < array_length(blueprint.weapons); i++)
				if(blueprint.weapons[i] > 0)
					for(var w = 0; w < blueprint.weapons[i]; w++)
					{
						draw_sprite_ext(weapon_sprite, i-1,
										_x+weapon_offset[weap%array_length(weapon_offset)][0],_y-weapon_offset[weap%array_length(weapon_offset)][1],1,1,rot++*90,_c,1);
						weap++;
					}
		rot = 3;
		var miss = 0;
		if(missile_sprite != noone)
			for(var i = 0; i < array_length(blueprint.missiles); i++)
				if(blueprint.missiles[i] > 0)
					for(var w = 0; w < (blueprint.missiles[i]+1) div 2; w++)
					{
						draw_sprite_ext(missile_sprite, i-1,
										_x+weapon_offset[(array_length(weapon_offset)-miss-1)%array_length(weapon_offset)][0],_y-weapon_offset[(array_length(weapon_offset)-miss-1)%array_length(weapon_offset)][1],1,1,rot--*90,_c,1);
						miss++;
					}
	}
	
	if(computer_sprite != noone)
		for(var i = 0; i < array_length(computer_offset); i++)
			draw_sprite_ext(computer_sprite,blueprint.ship_display[3],_x+computer_offset[i][0],_y-computer_offset[i][1],1,1,90*i,_c,1);
	
	if(hull_sprite != noone)
		draw_sprite_ext(hull_sprite,blueprint.ship_display[0],_x+hull_offset[0][0],_y-hull_offset[0][1],1,1,0,_c,1);
	
	if(drive_sprite != noone)
		draw_sprite_ext(drive_sprite,blueprint.ship_display[1],_x+drive_offset[0][0],_y-drive_offset[0][1],1,1,0,c_white,1);

	
	var shields = blueprint.shield;
	if(shields > 0)
	{
		draw_sprite_ext(s_ship_shield,0,_x,_y,(surface_dim[0]-1)/sprite_get_width(s_ship_shield),(surface_dim[1]-1)/sprite_get_height(s_ship_shield),0,_c,1);
		var s_mul = class + 1;
		for(var i = 0; i < shields; i++)
			draw_ellipse_color(0+s_mul*i,0+s_mul*i,surface_dim[0]-s_mul*i-3,surface_dim[1]-s_mul*i-3,_c,_c,true);
	}

	surface_reset_target();
	
	path_speed = orbit_speed + blueprint.ship_display[1]/4;
}
ship_path_start = function(_speed,_random_dir)
{
	if(_speed > 0)
	{
		x += path_get_x(orbit_path,1);
		y += path_get_y(orbit_path,0);
		path_start(orbit_path,_speed,path_action_continue,false);
		path_position = random(1);
		if(_random_dir)
		{
			if(random(1) >= .5)
				path_speed = -path_speed;
		}
	}
	else if(_random_dir)
	{
		var ran = irandom_range(0,5);
		var dist = 50*.4;
		
		x += dist*dcos(ran*60);
		y += dist*dsin(ran*60);
	}
}
ship_path_pause = function()
{
	path_endaction = path_action_stop;
}
ship_path_end = function()
{
	path_end();
}

