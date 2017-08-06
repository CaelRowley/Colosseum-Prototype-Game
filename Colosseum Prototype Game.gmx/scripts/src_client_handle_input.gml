message_id = argument[0];
buffer = argument[1];
unique_id = argument[2];
player = argument[3];
//Creating player

//Up
if(message_id == "W"){
    player.up_button = 1;
}
if(message_id == "NoW"){
    player.up_button = 0;
}

//Left
if(message_id == "A"){
    player.left_button = 1;
}
if(message_id == "NoA"){
    player.left_button = 0;
}

//Down
if(message_id == "S"){
    player.down_button = 1;
}
if(message_id == "NoS"){
    player.down_button = 0;
}

//Right
if(message_id == "D"){
    player.right_button = 1;
}
if(message_id == "NoD"){
    player.right_button = 0;
}

//Attack
if(message_id == "LMB"){
    player.attack_button = 1;
    player.alarm[1] = 0.1*room_speed
    //obj_client_player.image_index = 0;
    //obj_client_player.state = scr_client_player_attack_state;
    //obj_client_player.attack_button = 1;
    //obj_client_player.attack_button = 0;
}
if(message_id == "NoLMB"){
    player.attack_button = 0;
}

//Dash
if(message_id == "space"){
    player.dash_button = 1;
    player.alarm[2] = 0.1*room_speed
}
if(message_id == "Nospace"){
    player.dash_button = 0;  
}
