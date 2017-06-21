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
