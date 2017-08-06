var xx = argument1;
var yy = argument2;
var xScale = argument3;
var yScale = argument4;
var spritename = argument0;
var spriteheight = sprite_get_height(spritename) * xScale;
var spritewidth = sprite_get_width(spritename) * yScale;
var spriteleft = xx - (spritewidth / 2);
var spriteright = xx + (spritewidth / 2);
var spritetop = yy - (spriteheight / 2);
var spritebottom = yy + (spriteheight / 2);
result = false;

if device_mouse_x_to_gui(0) > spriteleft and device_mouse_x_to_gui(0) < spriteright and device_mouse_y_to_gui(0) > spritetop and device_mouse_y_to_gui(0) < spritebottom
    {
    draw_sprite_ext(spritename, 0, xx, yy, xScale, yScale, 0, c_white, 1);
    draw_sprite_ext(spritename, 0, xx, yy, xScale, yScale, 0, c_white, 1);
    instance_create(0, 0, obj_item_text);
    if mouse_check_button_released(mb_left)
        {
            show_debug_message("clicked");
        }
    }
else
    {
    draw_sprite_ext(spritename, 1, xx, yy, xScale, yScale, 0, c_white, 1);
    with(obj_item_text) instance_destroy();
    }
