///button_pressed_circle(x, y, sprite_index)
//
// Call this script as an if statement in the Draw GUI event of your menu object.
// x and y is the position of your button, sprite_index is the sprite you're using
// for the button.
//
// For example:
//
// if button_pressed_circle(display_get_gui_width() / 2, display_get_gui_height() / 2, spr_spritename)
//      { The code you want to run when the button is clicked }
//
//  Mouse over the button will cause it to swap to image_index 1.

var xx = argument0;
var yy = argument1;
var spritename = argument2;
var spriteheight = sprite_get_height(spritename);
var spritewidth = sprite_get_width(spritename);
var spriteradius = xx - (spritewidth / 2);
result = false;

if point_distance(xx, yy, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0)) < spriteradius
    {
    draw_sprite(spritename, 1, xx, yy);
    if mouse_check_button_released(mb_left)
        {
        result = true;
        }
    }
else
    {
    draw_sprite(spritename, 0, xx, yy);
    }

return(result);
