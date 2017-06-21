/// INI FILES

// [section] (key) = value

ini_open("settings.ini");

action_two_state = ini_read_string("PlayerControls", "actionTwoState", "scr_player_no_state");

ini_close();
