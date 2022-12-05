/// @description Settup sprite
var s = string_digits(object_get_name(self.object_index));
sprite_index = asset_get_index("s_alert_upgrade_"+string_char_at(s,1));
var index = real(s);
image_index = index % 10;