/// INI FILES

// [section] (key) = value

ini_open("settings.ini");

action_two_state = ini_read_string("PlayerControls", "actionTwoState", "scr_player_no_state");

for(var i = 0; i < array_length_1d(inv); i++) {
    inv[i] = ini_read_string("PlayerItems", string(i), "-1");
}

for(var i = 0; i < array_length_1d(inv); i++) {
    inv_number[i] = ini_read_real("PlayerInventory", string(inv[i]), 0);
}


ini_close();
