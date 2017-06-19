///scr_client_player_move_state()

/// Handle packets recieved

//var buffer = argument[0];
//scr_get_client_player_input();

//dash_button = keyboard_check_pressed(vk_space);
//attack_button = mouse_check_button_pressed(mb_left);

// Get the axis
player_xaxis = (right_button - left_button);
player_yaxis = (down_button - up_button);

// Get player direction
player_direction = point_direction(0, 0, player_xaxis, player_yaxis);

// Get player length
if(player_xaxis == 0 and player_yaxis == 0){
    player_length = 0;
} else{
    player_length = player_speed;
    scr_get_face();
    switch (face){
        case LEFT:
        sprite_index = spr_client_player_move_left;
            break;
        case RIGHT:
        sprite_index = spr_client_player_move_right;
            break;
        case UP:
        sprite_index = spr_client_player_move_up;
            break;
        case DOWN:
        sprite_index = spr_client_player_move_down;
            break;
    }
}

// Get player horizontal and verticle speeds 
player_hspeed = lengthdir_x(player_length, player_direction);
player_vspeed = lengthdir_y(player_length, player_direction);

// Move player
phy_position_x += player_hspeed;
phy_position_y += player_vspeed;

// Control the sprite
image_speed = player_image_speed;

if(player_length == 0) 
    image_index = 0;

// Abilities
if(dash_button && obj_player_stats.stamina >= DASH_COST){
    state = scr_client_player_dash_state;
    alarm[0] = room_speed / player_dash_time;
    obj_player_stats.stamina -= DASH_COST;
    obj_player_stats.alarm[0] = room_speed / 2;
}

if(attack_button){
    image_index = 0;
    state = scr_client_player_attack_state;
}
