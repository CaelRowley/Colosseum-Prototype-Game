///scr_client_player_attack_state()
image_speed = player_attack_speed;

player_look_direction = point_direction(x, y, mouse_x, mouse_y);

scr_get_face();
switch(face){
    case DOWN:
        sprite_index = spr_client_player_attack_down
        break;
        
    case LEFT:
        sprite_index = spr_client_player_attack_left
        break;
        
    case RIGHT:
        sprite_index = spr_client_player_attack_right
        break;
        
    case UP:
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
    hitbox.damage = attack_damage;
    attacked = true;
}
