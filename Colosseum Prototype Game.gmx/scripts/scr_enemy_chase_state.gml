///scr_enemy_chase_state()
scr_check_for_player();

var dir = point_direction(x, y, targetx, targety);
enemy_hspeed = lengthdir_x(slime_speed, dir);
enemy_vspeed = lengthdir_y(slime_speed, dir);
if(enemy_hspeed != 0)
    image_xscale = sign(enemy_hspeed);
phy_position_x += enemy_hspeed;
phy_position_y += enemy_vspeed;
