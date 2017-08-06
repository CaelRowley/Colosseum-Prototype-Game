///Handle packets recieved
var buffer = argument[0];
var socket = argument[1];
var ip = argument[2];
var unique_id = buffer_read(buffer, buffer_u32);
//show_debug_message(unique_id);
var message_id = buffer_read(buffer, buffer_string);

show_debug_message(message_id);
//
if(message_id == "NewPlayer"){
    //show_debug_message("Client: " + message_id);
    var mx = buffer_read(buffer, buffer_u32);
    var my = buffer_read(buffer, buffer_u32);
    //var unique_id = buffer_read(buffer, buffer_u32);
    //var seed = random_get_seed()
    //random_set_seed(seed);
    //show_debug_message(buffer);
    client_player = instance_create(mx, my, obj_client_player);
    client_player.unique_id = unique_id;
    ds_list_add(obj_client_connection_list.socket_list, client_player);
    
}else{
    var size = ds_list_size(obj_client_connection_list.socket_list);
    var i;
    for (i = 0; i < size; i += 1){
        var otherPlayer = ds_list_find_value(obj_client_connection_list.socket_list,i);
        //show_debug_message(otherPlayer.unique_id);
        if(otherPlayer.unique_id == unique_id){
            src_client_handle_input(message_id, buffer, unique_id, otherPlayer);
        }
    }
}


//Creating player


