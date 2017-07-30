/// INI FILES
// [section] (key) = value

var ability = argument[0];
ini_open("settings.ini");

//ini_write_string("PlayerControls", "actionTwoState", "scr_player_shield_state");
ini_write_string("PlayerControls", "actionTwoState", ability);

for(var i = 0; i < array_length_1d(inv); i++) {

    ini_write_real("PlayerInventory", string(inv[i]), inv_number[i]);
    ini_write_string("PlayerItems", string(i), string(inv[i]));

}

ini_close();
