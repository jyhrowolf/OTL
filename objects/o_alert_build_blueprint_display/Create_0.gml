/// @description Settup stuff
event_inherited();
depth = -16;

settup_blueprint = function(_blueprint)
{
	blueprint_name = _blueprint.blueprint_name;
	var s = string_digits(object_get_name(_blueprint.object_index));
	if(string_length(s) > 2)
		s = string_copy(s,2,2);
	sprite_index = asset_get_index("s_blueprint_clean_"+string(s));
}
