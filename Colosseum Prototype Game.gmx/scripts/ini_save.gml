/// INI FILES

// [section] (key) = value

ini_open("settings.ini");

ini_write_string("PlayerControls", "actionTwoState", "scr_player_shield_state");

ini_close();
