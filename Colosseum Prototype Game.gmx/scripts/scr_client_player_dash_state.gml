///scr_player_dash_state()
scr_get_client_player_input();
if(player_length == 0){
    player_direction = face * 90;
}

// Dash speed
player_length = player_speed * player_dash_speed;

// Get player horizontal and verticle speeds 
player_hspeed = lengthdir_x(player_length, player_direction);
player_vspeed = lengthdir_y(player_length, player_direction);

// Move player
phy_position_x += player_hspeed;
phy_position_y += player_vspeed;
    
// Create dash effect
var dash = instance_create(x, y, obj_player_dash_effect);
dash.sprite_index = sprite_index;
dash.image_index = image_index;

