///scr_client_player_attack_state()
image_speed = player_attack_speed;

switch(sprite_index){
    case spr_client_player_move_down:
        sprite_index = spr_client_player_attack_down
        break;
        
    case spr_client_player_move_left:
        sprite_index = spr_client_player_attack_left
        break;
        
    case spr_client_player_move_right:
        sprite_index = spr_client_player_attack_right
        break;
        
    case spr_client_player_move_up:
        sprite_index = spr_client_player_attack_up
        break;
}

if(image_index >= 3 and attacked == false){
    var xx = 0;
    var yy = 0;
    switch(sprite_index){
        case spr_client_player_attack_down:
            xx = x;
            yy = y + 12;
            break;
            
        case spr_client_player_attack_left:
            xx = x - 10;
            yy = y + 2;
            break;
            
        case spr_client_player_attack_right:
            xx = x + 10;
            yy = y + 2;
            break;
            
        case spr_client_player_attack_up:
            xx = x;
            yy = y - 10;
            break;
    }

    var hitbox = instance_create(xx, yy, obj_player_attack_hitbox);
    hitbox.creator = id;
    hitbox.damage = obj_client_player_stats.attack_damage;
    attacked = true;
}
