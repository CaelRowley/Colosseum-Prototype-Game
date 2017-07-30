///Handle packets recieved
var buffer = argument[0];
var socket = argument[1];
var ip = argument[2];
var message_id = buffer_read(buffer, buffer_string);
show_debug_message(message_id)
//Creating player
if(message_id == "Player2"){
    show_debug_message("Client: " + message_id);
    var mx = buffer_read(buffer, buffer_u32);
    var my = buffer_read(buffer, buffer_u32);
    instance_create(mx, my, obj_client_player);
    //if (socket == noone){
        ds_list_add(obj_client_connection_list.socket_list, socket);
        show_debug_message("Initial socket connect to: " + ip);
    //}
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
    obj_client_player.alarm[1] = 0.1*room_speed
    //obj_client_player.image_index = 0;
    //obj_client_player.state = scr_client_player_attack_state;
    //obj_client_player.attack_button = 1;
    //obj_client_player.attack_button = 0;
}
if(message_id == "NoLMB"){
    obj_client_player.attack_button = 0;
}

//Dash
if(message_id == "space"){
    obj_client_player.dash_button = 1;
    obj_client_player.alarm[2] = 0.1*room_speed
}
if(message_id == "Nospace"){
    obj_client_player.dash_button = 0;  
}

