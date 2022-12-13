// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function map_hash(_coord)
{
	return _coord[0]*100 + _coord[1];
}

function update_planets(_hex)
{
	for(var i = 0; i < array_length(_hex.planets); i++)
	{
		_hex.planets[i].my_color = global.player_color[_hex.player];
	}
}

function zoom_camera(_pc,_change,_selected_hex)
{
	var player = _pc.players[_pc.active_player];
	if(_change > 0)
		if(player.zoom + _change <= 3)
			player.zoom += _change;
		else
			player.zoom = 3;
	else
		if(player.zoom + _change >= 1)
				player.zoom += _change;
			else
				player.zoom = 1;
	
	rotate_camera(_pc,0,_selected_hex);
}

function rotate_camera(_pc,_change,_selected_hex)
{
	_pc.players[_pc.active_player].rot += _change;
	
	var rot = _pc.players[_pc.active_player].rot;
	var zoom = _pc.players[_pc.active_player].zoom;
	
	camera_set_view_size(view_camera[0], view_wport[0]/zoom, view_hport[0]/zoom);
	
	var c_width = camera_get_view_width(view_camera[0]); // center camera on player 1
	var c_height = camera_get_view_height(view_camera[0]);
	camera_set_view_pos(view_camera[0],_selected_hex.x-c_width/2,_selected_hex.y-c_height/2);
	camera_set_view_angle(view_camera[0],-rot * 60 - 60);
	
	for (var i = 0; i < instance_number(o_planet); i++)
	{
	    var p = instance_find(o_planet,i);
		p.image_angle = rot * 60 + 60;
	}
	for (var i = 0; i < instance_number(o_system); i++)
	{
	    var t = instance_find(o_system,i);
		t.direction = rot * 60 + 60;
	}
}

//Draw functions
function draw_system(_system,_color)
{
	var _x = _system.x;
	var _y = _system.y;
	var hex_x = global.hex_x;
	var hex_y = global.hex_y;
	draw_circle_color(_x-1,_y-1,global.hex_size/7,_color,_color,false);
	draw_circle_color(_x-1,_y-1,global.hex_size/7-1,c_black,c_black,false); //draw center cirlce
	
	var pc = instance_find(o_player_controller,0);
	var my_color = c_dkgrey;
	if(_system.player != 0)
		my_color = pc.players[_system.player].species.faction_color;
	
	for(var i = 0; i < 6; i++) //draw_boundaries
		draw_line_width_color(_x + hex_x[i]*.95,_y + hex_y[i]*.95,
							_x + hex_x[i+1]*.95,_y + hex_y[i+1]*.95,
							1,my_color,my_color);
	if(_system.system_center == noone) //draw influence
	{
		_system.system_center = instance_create_layer(_x,_y,"Map",o_system_center);
		_system.system_center.system = _system;
	}
	my_color += #202020;

	if(hovered)
		for(var i = 0; i < 6; i++)//draw boundaries
		{
			draw_line_width_color(_x + hex_x[i],_y + hex_y[i],
								lerp(_x + hex_x[i],_x + hex_x[i+1],0.3),
								lerp(_y + hex_y[i],_y + hex_y[i+1],0.3),
								1,my_color,my_color);
							
			draw_line_width_color(_x + hex_x[6-i],_y + hex_y[6-i],
								lerp(_x + hex_x[6-i],_x + hex_x[6-i-1],0.3),
								lerp(_y + hex_y[6-i],_y + hex_y[6-i-1],0.3),
								1,my_color,my_color);
		}
}

function draw_empty_system(_system)
{
	var _x = _system.x;
	var _y = _system.y;
	var hex_x = global.hex_x;
	var hex_y = global.hex_y;
	var tier = _system.tier;
	tier = tier*(tier<4) + 3*(tier>=4);
	
	var _color = c_ltgrey;
	if(tier == 2)
		_color = c_grey;
	else if(tier >= 3)
		_color = c_dkgrey;
	if(_system.highlighted)
		_color = #6AABF4;
	if(_system.hovered)
		_color = c_white;
		
	var s = ""; //calculate tier
	for(var j = 0; j < tier; j++)
	{
		s += "I";
	}
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(f_game_tier);
	draw_text_transformed_color(_x+1,_y+1,s,1,1,_system.direction,_color,_color,_color,_color,1.0);//draw tier
	
	for(var i = 0; i < 6; i++)//draw boundaries
	{
		draw_line_width_color(_x + hex_x[i]*.95,_y + hex_y[i]*.95,
							lerp(_x + hex_x[i]*.95,_x + hex_x[i+1]*.95,0.15+_system.hovered*.15),
							lerp(_y + hex_y[i]*.95,_y + hex_y[i+1]*.95,0.15+_system.hovered*.15),
							1,_color,_color);
							
		draw_line_width_color(_x + hex_x[6-i]*.95,_y + hex_y[6-i]*.95,
							lerp(_x + hex_x[6-i]*.95,_x + hex_x[6-i-1]*.95,0.15+_system.hovered*.15),
							lerp(_y + hex_y[6-i]*.95,_y + hex_y[6-i-1]*.95,0.15+_system.hovered*.15),
							1,_color,_color);
	}
}

function draw_highlight_system(_system)
{
	var _x = _system.x;
	var _y = _system.y;
	var pc = instance_find(o_player_controller,0);
	var my_color = pc.players[pc.active_player].species.faction_color;
	
	for(var i = 0; i < 6; i++)//draw boundaries
	{
		draw_line_width_color(_x + global.hex_x[i],_y + global.hex_y[i],
							lerp(_x + global.hex_x[i],_x + global.hex_x[i+1],0.2+_system.hovered*.1),
							lerp(_y + global.hex_y[i],_y + global.hex_y[i+1],0.2+_system.hovered*.1),
							1,my_color,my_color);
							
		draw_line_width_color(_x + global.hex_x[6-i],_y + global.hex_y[6-i],
							lerp(_x + global.hex_x[6-i],_x + global.hex_x[6-i-1],0.2+_system.hovered*.1),
							lerp(_y + global.hex_y[6-i],_y + global.hex_y[6-i-1],0.2+_system.hovered*.1),
							1,my_color,my_color);
	}
}
function draw_center_system(_system,_color)
{
	var _x = _system.x;
	var _y = _system.y;
	var pc = instance_find(o_player_controller,0);
	var my_color = c_dkgrey;
	if(_system.player != 0)
		my_color = pc.players[_system.player].species.faction_color;
		
	if(_system.player != 0) //draw influence
		draw_sprite_ext(s_influence,0,_x,_y,1,1,_system.direction,my_color,1);
		
	//draw artifact
	if(_system.artifact)
		draw_sprite_ext(s_artifact,0,_x+(-8+(_system.exploration_token == noone))*2,_y,1,1,_system.direction,_color,1.0);
	//draw victory points
	_color = global.player_color[_system.player];
	if(_color == c_grey)
		_color -= #404040;
		
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(f_game_small);
	draw_text_transformed_color(_x + (8-(_system.exploration_token == noone))*2,_y,_system.victory_points,1,1,_system.direction,
								_color,_color,_color,_color,1.0);
}


function draw_system_enemy(_system,_sprite,_index)
{
	var _x = _system.x;
	var _y = _system.y;
	draw_sprite_ext(_sprite,_index-1,_x,_y,1,1,_system.direction,c_white,1);
}

function draw_system_token(_system,_color)
{
	var _x = _system.x-.5;
	var _y = _system.y-.5;
	draw_sprite_ext(s_exploration_token,0,_x,_y,1,1,0,_color,1);
}

function draw_system_warp_tunnels(_system)
{
	for(var i = 0; i < 6; i++)
	{
		var _x = _system.x;
		var _y = _system.y;
		if(_system.layout[i])
		{
			_x += (global.hex_size-8)*cos(-pi/3*i + pi/6);
			_y += (global.hex_size-8)*sin(-pi/3*i + pi/6);
			var _rot = 60*i+60;
			if(i == 0 || i == 1 || i == 5)
			{
				_x += 2*cos(-pi/3*i + pi/6);
				_y += 2*sin(-pi/3*i + pi/6);
			}
			
			draw_sprite_ext(s_warp_tunnel, 0, _x, _y, 1, 1, _rot, c_white, 1);
		}
	}
}

function draw_rectangle_width(x1,y1,x2,y2,w,_color)
{
	draw_line_width_color(x1 - w/2, y1, x2 + w/2, y1, w,_color,_color);
	draw_line_width_color(x2, y1 + w/2, x2, y2 - w/2, w,_color,_color);
	draw_line_width_color(x1 - w/2, y2, x2 + w/2, y2, w,_color,_color);
	draw_line_width_color(x1, y1 + w/2, x1, y2 - w/2, w,_color,_color);
}