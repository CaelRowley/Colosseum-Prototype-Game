///scr_player_gun_state()
scr_get_player_input();

if(!obj_player_stats.gun_active) {
    obj_player_stats.gun_active = true;
    instance_create(x, y-10, obj_player_gun)
}

if(action_one_button_pressed) {
    show_debug_message("shoot gun")
    instance_create(x, y-10, obj_player_bullet);
}

if(action_two_button_released){
    obj_player_stats.gun_active = false;
    image_index = 0;
    state = scr_player_move_state;
}

// Get player direction
player_move_direction = point_direction(0, 0, player_xaxis, player_yaxis);
player_look_direction = point_direction(x, y, mouse_x, mouse_y);

// Get player length
if(player_xaxis == 0 and player_yaxis == 0) {
    player_length = 0;
} else {
    player_length = player_speed / 3;
}

scr_get_face();
switch (face){
    case LEFT:
        sprite_index = spr_player_move_left;
        break;
    case RIGHT:
        sprite_index = spr_player_move_right;
        break;
    case UP:
        sprite_index = spr_player_move_up;
        break;
    case DOWN:
        sprite_index = spr_player_move_down;
        break;
}

// Get player horizontal and verticle speeds 
player_hspeed = lengthdir_x(player_length, player_move_direction);
player_vspeed = lengthdir_y(player_length, player_move_direction);

// Move player
phy_position_x += player_hspeed;
phy_position_y += player_vspeed;

// Control the sprite
image_speed = player_image_speed;

if(player_length == 0) 
    image_index = 0;
