/// INI FILES

// [section] (key) = value

ini_open("settings.ini");

actionTwoState = ini_read_string("PlayerControls", "actionTwoState", "scr_player_shield_state");

ini_close();
