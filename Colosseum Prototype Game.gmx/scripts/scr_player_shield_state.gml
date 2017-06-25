///scr_player_shield_state()
scr_get_player_input();

// Get player direction
player_move_direction = point_direction(0, 0, player_xaxis, player_yaxis);
player_look_direction = point_direction(x, y, mouse_x, mouse_y);

// Get player length

if(player_xaxis == 0 and player_yaxis == 0) {
    player_length = 0;
} else {
    player_length = player_speed / 2;
}

scr_get_face();
switch (face){
    case LEFT:
        sprite_index = spr_player_shield_left;
        break;
    case RIGHT:
        sprite_index = spr_player_shield_right;
        break;
    case UP:
        sprite_index = spr_player_shield_up;
        break;
    case DOWN:
        sprite_index = spr_player_shield_down;
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

if(action_one_button_pressed){
    image_index = 0;
    state = scr_player_attack_state;
    show_debug_message("attack from shield");
}
    
if(action_two_button_released){
    shield_active = false;
    image_index = 0;
    state = scr_player_move_state;
}
