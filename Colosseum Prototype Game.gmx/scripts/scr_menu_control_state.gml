///scr_menu_control_state()
scr_get_menu_input();

if(enter_button){
    instance_create(mouse_x, mouse_y, obj_player)
}

if(tab_button_pressed){
//view_wview[0...7] will give you the width of the view, view_hview[0...7] 
    instance_create(view_xview[0]+view_wview[0]/2, view_yview[0]+view_hview[0]/2, obj_skeleton_menu_stats);
    show_debug_message("paused");
}

if(tab_button_released){
    with (obj_skeleton_menu_stats) instance_destroy();
    show_debug_message("unpaused");
}
