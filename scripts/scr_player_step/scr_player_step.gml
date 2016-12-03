
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

/*
if (move_to_target)
{
	// *this relies on having a minimum distance in pixels which can't be relied apon
	//var distance = point_distance(x, y, target_x, target_y);
	//if (distance > 5)
	//{
	//	velocity_x = last_velocity_x;
	//	velocity_y = last_velocity_y;
	//}
	//else
	//{
	//	// move to the target position this step
	//	// if the distance left is 5 pixels, and i want to move there this step,
	//	// then by dividing by the current TICK: 5 / 0.016666 = 300
	//	// then, in the end step event when velocity is multiplied by TICK: 300 * 0.016666 = 5
	//	// I'll get the number of pixels to move, which is 5 pixels.
	//	move_to_target = false
	//	var angle = degtorad(image_angle);
	//	var move_speed = (distance / global.TICK);
	//	velocity_x = (cos(angle) * (move_speed));
	//	velocity_y = (sin(angle) * (move_speed) * -1);
	//}
	
	// reset velocity
	velocity_x = last_velocity_x;
	velocity_y = last_velocity_y;
	
	move_to_target_timer += global.TICK;
	//if (move_to_target_timer >= move_to_target_time)
	if (move_to_target_timer >= (move_to_target_time - global.TICK))
	{
		move_to_target = false
		
		// reset timer
		move_to_target_timer = 0;
		
		// find the remaining distance to target
		var distance_to_target = point_distance(x, y, target_x, target_y);
		var time_to_target = (distance_to_target / global.TICK);
		
		// get the angle and convert to radians
		// * don't use the instance angle incase its overshot the target
		var angle = point_direction(x, y, target_x, target_y);
		angle = degtorad(angle);
		
		// set velocity so the target position is reached in this step
		// *can cause the instance to bounce as it overshots the target then snaps back
		velocity_x = (cos(angle) * (time_to_target));
		velocity_y = (sin(angle) * (time_to_target) * -1);
	}
}
*/

if (move_to_target)
{
	// reset velocity
	velocity_x = last_velocity_x;
	velocity_y = last_velocity_y;
}

if (mouse_check_button_pressed(mb_right))
{
	move_to_target = true;
	move_to_target_timer = 0;
	
	target_x = mouse_x;
	target_y = mouse_y;
	
	// get the distance and time to target
	var distance_to_target = point_distance(x, y, target_x, target_y);
	var time_to_target = (distance_to_target / move_to_target_time);
	
	// point towards the target
	image_angle = point_direction(x, y, target_x, target_y);
	var angle = degtorad(image_angle);
	
	// set the velocity so the target is reached in the set amount of time
	velocity_x = (cos(angle) * (time_to_target));
	velocity_y = (sin(angle) * (time_to_target) * -1);
}

/*
if (mouse_check_button_pressed(mb_right))
{
	move_to_target = true;
	
	target_x = mouse_x;
	target_y = mouse_y;
	
	//var microseconds = (1/1000000);
	//var time_to_target = (microseconds * 1); // one second
	var time_to_target = 1; // one second
	distance_to_target = point_distance(x, y, target_x, target_y);
	distance_to_step_towards_target = distance_to_target / time_to_target;
	
	show_debug_message("distance to target: " + string(distance_to_target));
	show_debug_message("time to target: " + string(time_to_target));
	
	// point towards the target
	image_angle = point_direction(x, y, target_x, target_y);
	
	//var move_speed = (distance_to_step_towards_target * delta_time);
	var move_speed = (distance_to_step_towards_target * global.TICK);
	var angle = degtorad(image_angle);
	velocity_x = (cos(angle) * (move_speed));
	velocity_y = (sin(angle) * (move_speed) * -1);
	
	show_debug_message("velocity x: " + string(velocity_x));
	show_debug_message("velocity y: " + string(velocity_y));
}

if (move_to_target)
{
	//var move_speed = (distance_to_step_towards_target * delta_time);
	var move_speed = (distance_to_step_towards_target * global.TICK);
	
	var angle = degtorad(image_angle);
	velocity_x = (cos(angle) * (move_speed));
	velocity_y = (sin(angle) * (move_speed) * -1);
}
*/

/*
if (mouse_check_button_pressed(mb_right))
{
	move_to_target = true;
	
	target_x = mouse_x;
	target_y = mouse_y;
	
	var microseconds = 1000000;
	var time_to_target = (microseconds * 1); // one second
	distance_to_target = point_distance(x, y, target_x, target_y);
	distance_to_step_towards_target = distance_to_target / time_to_target;
	
	show_debug_message("distance to target: " + string(distance_to_target));
	show_debug_message("time to target: " + string(time_to_target));
	
	// point towards the target
	image_angle = point_direction(x, y, target_x, target_y);
	
	var move_speed = (distance_to_step_towards_target * delta_time);
	var angle = degtorad(image_angle);
	velocity_x = (cos(angle) * (move_speed));
	velocity_y = (sin(angle) * (move_speed) * -1);
	
	show_debug_message("velocity x: " + string(velocity_x));
	show_debug_message("velocity y: " + string(velocity_y));
}

if (move_to_target)
{
	var move_speed = (distance_to_step_towards_target * delta_time);
	
	var angle = degtorad(image_angle);
	velocity_x = (cos(angle) * (move_speed));
	velocity_y = (sin(angle) * (move_speed) * -1);
}
*/

/*
if (mouse_check_button_pressed(mb_right))
{
	target_x = mouse_x;
	target_y = mouse_y;
	move_to_target = true;
	
	// get the distance to the target
	var distance = point_distance(x, y, target_x, target_y);
	show_debug_message(distance);
	var target_move_speed = (distance/30); // get there in 1 second (!!! except its taking two seconds???)
	
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
*/

