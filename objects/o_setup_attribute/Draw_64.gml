/// @description Draw atribute
draw_self();

// Draw text
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(f_gui_normal);

draw_set_color(text_color);
draw_text(x-16, y, attribute_text);
draw_set_color(attribute_color);
draw_text(x+sprite_width/2-16, y, attribute_value);

draw_set_halign(fa_left);
draw_set_valign(fa_top);