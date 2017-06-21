///scr_player_shield_state()
scr_get_player_input();

if(!obj_player_stats.shield_active) {
    obj_player_stats.shield_active = true;
    instance_create(x, y-10, obj_shield)
}

if(action_two_button_released){
    obj_player_stats.shield_active = false;
    image_index = 0;
    state = scr_player_move_state;
}
