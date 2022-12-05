/// @description Create Function
depth = -16;
generate_upgrade = function(_upgrade)
{
	upgrade = instance_create_layer(0,0,"GUI",asset_get_index("o_ship_part_"+string(_upgrade)));
	upgrade_name = upgrade.part_name;
	equipment = upgrade.equipment;
	upgrade_sprite = asset_get_index("s_alert_upgrade_"+string_char_at(_upgrade,1));
	var index = real(_upgrade);
	var modi = 1;
	if(index div 10 < 3)
		modi = -1;
		
	upgrade_index = index % 10;
	x += (21 * upgrade_index)*2*modi;
}

generate_rare_upgrade = function(_upgrade)
{
	upgrade = _upgrade;
	upgrade_name = upgrade.part_name;
	equipment = upgrade.equipment;
	upgrade_sprite = _upgrade.sprite_index;
	upgrade_index = _upgrade.image_index;
}