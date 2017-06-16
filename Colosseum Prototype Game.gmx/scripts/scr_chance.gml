///scr_chance(percentage)
// Between 1 and 0
var percent = argument[0];
percent = clamp(percent, 0, 1)
return random(1) < percent;
