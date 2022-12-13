/// @description update depth

reset_depth = function()
{
	depth = class-2;
}

reset_depth();
	
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

update_ship = function(_ship)
{
	player = _ship.player;
	class = _ship.class;
	my_color = _ship.my_color;
	weapon_offset = _ship.weapon_offset;
	computer_offset = _ship.computer_offset;
	hull_offset = _ship.hull_offset;
	drive_offset = _ship.drive_offset;
	blueprint = _ship.blueprint;
	ship_sprite = _ship.ship_sprite;
	weapon_sprite = _ship.weapon_sprite;
	missile_sprite = _ship.missile_sprite;
	computer_sprite = _ship.computer_sprite;
	hull_sprite = _ship.hull_sprite;
	drive_sprite = _ship.drive_sprite;
	
	sprite_index = ship_sprite;
	direction = _ship.direction;
	
	if(surface_dim[0] <= 0)
		surface_dim = [sprite_width,sprite_width];
	surface_dim[0] = ceil(surface_dim[0]*1.25);
	surface_dim[1] = ceil(surface_dim[1]*1.25);

	surf = surface_create(surface_dim[0],surface_dim[1]);
	
	update_blueprint();
	alarm[0] = 30;
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
	if(computer_sprite != noone)
		draw_sprite_ext(computer_sprite,blueprint.ship_display[3],_x+computer_offset[0][0],_y-computer_offset[0][1],1,1,0,_c,1);
	
	if(hull_sprite != noone)
		draw_sprite_ext(hull_sprite,blueprint.ship_display[0],_x+hull_offset[0][0],_y-hull_offset[0][1],1,1,0,_c,1);
	
	if(drive_sprite != noone)
		draw_sprite_ext(drive_sprite,blueprint.ship_display[1],_x+drive_offset[0][0],_y-drive_offset[0][1],1,1,0,c_white,1);
	
	var shields = blueprint.shield;
	if(shields > 0)
	{
		draw_sprite_ext(s_ship_shield,0,_x,_y,(surface_dim[0]-1)/sprite_get_width(s_ship_shield),(surface_dim[1]-1)/sprite_get_height(s_ship_shield),0,_c,1);
		var s_mul = class + 1;
		for(var i = 1; i < shields; i++)
			draw_ellipse_color(0+s_mul*i-1,0+s_mul*i,surface_dim[0]-s_mul*i-2,surface_dim[1]-s_mul*i-3,_c,_c,true);
	}

	surface_reset_target();
}

