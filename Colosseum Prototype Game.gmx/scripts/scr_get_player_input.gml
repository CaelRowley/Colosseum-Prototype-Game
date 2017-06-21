///scr_get_player_input()
// Set movement controls
up_button = keyboard_check(ord("W"));
left_button = keyboard_check(ord("A"));
right_button = keyboard_check(ord("D"));
down_button = keyboard_check(ord("S"));

// Set abilitiy controls
dash_button_pressed = keyboard_check_pressed(vk_space);
action_one_button_pressed = mouse_check_button_pressed(mb_left);
action_two_button_pressed = mouse_check_button_pressed(mb_right);
action_two_button_released = mouse_check_button_released(mb_right);

// Get the axis
player_xaxis = (right_button - left_button);
player_yaxis = (down_button - up_button);

// Save and load controls
save_button = keyboard_check(ord("K"));
load_button = keyboard_check(ord("L"));

// Use gamepad if able
if(gamepad_is_connected(0)){
    gamepad_set_axis_deadzone(0, 0.3);
    player_xaxis = (gamepad_axis_value(0, gp_axislh));
    player_yaxis = (gamepad_axis_value(0, gp_axislv));
    dash_button_pressed = gamepad_button_check_pressed(0, gp_face2);
    action_one_button_pressed = gamepad_button_check_pressed(0, gp_face3);
}
