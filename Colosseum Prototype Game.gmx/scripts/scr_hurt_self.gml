///scr_hurt_self(damage)
var damage = argument0;

if(shield_active){
    show_debug_message(0);
}
else {
    show_debug_message(damage);
    obj_player_stats.hp -= damage
}

/*
if(!shield_active) {
    hp -= damage;
}
*/
