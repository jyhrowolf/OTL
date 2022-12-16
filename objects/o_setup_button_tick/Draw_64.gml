/// @description Draw Button
draw_self();

// Draw text
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(f_gui_normal);

draw_set_color(text_color);
draw_text(x, y, button_text);
draw_set_color(c_white);

draw_set_halign(fa_left);
draw_set_valign(fa_top);