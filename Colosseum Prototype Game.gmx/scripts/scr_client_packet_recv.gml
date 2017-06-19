///Handle packets recieved
var buffer = argument[0];
var message_id = buffer_read(buffer, buffer_string);

//Creating player
if(message_id == "Player2"){
    show_debug_message("Client: " + message_id);
    var mx = buffer_read(buffer, buffer_u32);
    var my = buffer_read(buffer, buffer_u32);
    instance_create(mx, my, obj_client_player);
}

//Up
if(message_id == "W"){
    obj_client_player.up_button = 1;
}
if(message_id == "NoW"){
    obj_client_player.up_button = 0;
}

//Left
if(message_id == "A"){
    obj_client_player.left_button = 1;
}
if(message_id == "NoA"){
    obj_client_player.left_button = 0;
}

//Down
if(message_id == "S"){
    obj_client_player.down_button = 1;
}
if(message_id == "NoS"){
    obj_client_player.down_button = 0;
}

//Right
if(message_id == "D"){
    obj_client_player.right_button = 1;
}
if(message_id == "NoD"){
    obj_client_player.right_button = 0;
}

//Attack
if(message_id == "LMB"){
    obj_client_player.attack_button = 1;
}
if(message_id == "NoLMB"){
    obj_client_player.attack_button = 0;
}

//Dash
if(message_id == "space"){
    obj_client_player.dash_button = 1;
}
if(message_id == "Nospace"){
    obj_client_player.dash_button = 0;  
}

