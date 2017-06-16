///scr_get_player_input()
// Set movement controls
up_button = keyboard_check(ord("W"));
left_button = keyboard_check(ord("A"));
right_button = keyboard_check(ord("D"));
down_button = keyboard_check(ord("S"));

// Set abilitiy controls
dash_button = keyboard_check_pressed(vk_space);
attack_button = mouse_check_button_pressed(mb_left);
shield_button = mouse_check_button_pressed(mb_right);

shield_button_released = mouse_check_button_released(mb_right);

// Get the axis
player_xaxis = (right_button - left_button);
player_yaxis = (down_button - up_button);

// Use gamepad if able
if(gamepad_is_connected(0)){
    gamepad_set_axis_deadzone(0, 0.3);
    player_xaxis = (gamepad_axis_value(0, gp_axislh));
    player_yaxis = (gamepad_axis_value(0, gp_axislv));
    dash_button = gamepad_button_check_pressed(0, gp_face2);
    attack_button = gamepad_button_check_pressed(0, gp_face3);
}
