/// INI FILES
// [section] (key) = value

var ability = argument0;
ini_open("settings.ini");

//ini_write_string("PlayerControls", "actionTwoState", "scr_player_shield_state");
ini_write_string("PlayerControls", "actionTwoState", ability);

ini_close();
