///scr_player_move_state()
scr_get_player_input();

// Get player direction
player_move_direction = point_direction(0, 0, player_xaxis, player_yaxis);
player_look_direction = point_direction(0, 0, player_xaxis, player_yaxis);

// Get player length
if(player_xaxis == 0 and player_yaxis == 0){
    player_length = 0;
} else{
    player_length = player_speed;
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

// Abilities
if(dash_button_pressed && obj_player_stats.stamina >= DASH_COST){
    state = scr_player_dash_state;
    alarm[0] = room_speed / player_dash_time;
    obj_player_stats.stamina -= DASH_COST;
    obj_player_stats.alarm[0] = room_speed / 2;
}

if(action_one_button_pressed){
    image_index = 0;
    state = scr_player_attack_state;
}

if(action_two_button_pressed){
    image_index = 0;
    switch (action_two_state){
        case "scr_player_shield_state":
            shield_active = true;
            state = scr_player_shield_state;
            break;
        case "scr_player_gun_state":
            state = scr_player_gun_state;
            break;
    }
}

if(save_shield_button){
    ini_save("scr_player_shield_state");
}

if(save_gun_button){
    ini_save("scr_player_gun_state");
}

if(load_button){
    ini_load();
}
