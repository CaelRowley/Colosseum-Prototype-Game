///scr_draw_shadow(offset)
var offset = argument0

// Draw shadow
draw_sprite_ext(sprite_index, -1, x+offset, y+offset, 1, 1, image_angle, c_black, 0.4);
draw_self();
