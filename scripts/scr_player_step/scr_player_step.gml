
/*
if (keyboard_check(global.KEY_LEFT))
{
	x += global.LEFT;
}
else if (keyboard_check(global.KEY_RIGHT))
{
	x += global.RIGHT;
}

if (keyboard_check(global.KEY_UP))
{
	y += global.UP;
}
else if (keyboard_check(global.KEY_DOWN))
{
	y += global.DOWN;
}
*/

// update inputs
key_left = keyboard_check(global.KEY_LEFT);
key_right = keyboard_check(global.KEY_RIGHT);
key_up = keyboard_check(global.KEY_UP);
key_down = keyboard_check(global.KEY_DOWN);

velocity_x = 0;
if (key_left)
{
    velocity_x = (speed_x * global.LEFT);
}
else if (key_right)
{
    velocity_x = (speed_x * global.RIGHT);
}

velocity_y = 0;
if (key_up)
{
    velocity_y = (speed_x * global.UP);
}
else if (key_down)
{
    velocity_y = (speed_x * global.DOWN);
}