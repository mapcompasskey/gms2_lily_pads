
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

if (velocity_x || velocity_y)
{
	var destination_x = (x + velocity_x);
	var destination_y = (y + velocity_y);
	var angle = point_direction(x, y, destination_x, destination_y);
	angle = degtorad(angle);
	velocity_x = (cos(angle) * speed_x);
	velocity_y = (sin(angle) * speed_y * -1);
}

if (mouse_check_button(mb_left))
{
	move_to_target = false;
	
	target_x = mouse_x;
	target_y = mouse_y;
	
	// get the angle (in radians) to the target
	var angle = point_direction(x, y, target_x, target_y);
	angle = degtorad(angle);
	
	// move towards the target
	// sin() calculations need to be inverted (-1)
	velocity_x = (cos(angle) * (speed_x));
	velocity_y = (sin(angle) * (speed_y) * -1);
	
	// point towards the target
	image_angle = point_direction(x, y, target_x, target_y);
}

if (mouse_check_button_pressed(mb_right))
{
	target_x = mouse_x;
	target_y = mouse_y;
	move_to_target = true;
	
	// get the distance to the target
	var distance = point_distance(x, y, target_x, target_y);
	show_debug_message(distance);
	var target_move_speed = (distance/60); // get there in 1 second (!!! except its taking two seconds???)
	
	// set movemvent speed
	move_towards_point(target_x, target_y, target_move_speed);
	
	// point towards the target
	image_angle = point_direction(x, y, target_x, target_y);
}

if (move_to_target)
{
	// get the distance to the target
	var distance = point_distance(x, y, target_x, target_y);
	
	// if within one pixel of the target
	if (distance < 1)
	{
		move_to_target = false;
	}
}

if ( ! move_to_target && speed != 0)
{
	speed = 0;
}


