
// update inputs
key_left = keyboard_check(global.KEY_LEFT);
key_right = keyboard_check(global.KEY_RIGHT);
key_up = keyboard_check(global.KEY_UP);
key_down = keyboard_check(global.KEY_DOWN);
mouse_left_pressed = mouse_check_button_pressed(mb_left);

// clear velocity
velocity_x = 0;
velocity_y = 0;


//
// Move with Arrow Keys
//

if (key_left)
{
    velocity_x = (speed_x * global.LEFT);
}
else if (key_right)
{
    velocity_x = (speed_x * global.RIGHT);
}

if (key_up)
{
    velocity_y = (speed_x * global.UP);
}
else if (key_down)
{
    velocity_y = (speed_x * global.DOWN);
}

if (velocity_x != 0 || velocity_y != 0)
{
	// get the target direction
	var destination_x = (x + velocity_x);
	var destination_y = (y + velocity_y);
	
	// get the angle (in degrees) to the target
	var angle = point_direction(x, y, destination_x, destination_y);
	
	// point towards the target
	image_angle = angle;
	
	// move towards the target
	// sin() calculations need to be inverted (-1)
	velocity_x = (dcos(angle) * speed_x);
	velocity_y = (dsin(angle) * speed_y * -1);
}


//
// Move Towards the Mouse
//
// The distance conditional prevents the instance from bouncing on the target point
// as it reaches it, overshoots it, moves back towards it, overshoots it, and on and on.
//
/*
if (mouse_check_button(mb_left))
{
	moving = false;
	
	// set the target position
	target_x = mouse_x;
	target_y = mouse_y;
	
	var distance = point_distance(x, y, target_x, target_y);
	if (distance > 5)
	{
		// get the angle (in degrees) to the target
		var angle = point_direction(x, y, target_x, target_y);
		
		// point towards the target
		image_angle = angle;
		
		// move towards the target
		// sin() calculations need to be inverted (-1)
		velocity_x = (dcos(angle) * speed_x);
		velocity_y = (dsin(angle) * speed_y * -1);
	}
}
*/

//
// Move To Target (With Constant Time)
//
// "moving" is set to false in the END STEP event the target is about to be overshot.
//

// if moving to target
if (moving)
{
	// reset velocity
	velocity_x = last_velocity_x;
	velocity_y = last_velocity_y;
	
	// if the player is colliding with a bug
	if (place_meeting(x, y, obj_bug))
	{
		with (obj_bug)
		{
			// if the bug isn't dying
			if ( ! dying)
			{
				// if the bug is colliding with the player instance
				if (place_meeting(x, y, other))
				{
					dying = true;
				}
			}
		}
	}
	
}

// else, if target reached
else if (target_reached)
{
	// if the target wasn't an instance
	if (target_id == noone)
	{
		// *fell in the water
		game_restart();
		exit;
	}
	
	// if the target instance exists
	if (instance_exists(target_id))
	{
		// if object is a turtle
		if (object_get_name(target_id.object_index) == "obj_turtle")
		{
			game_restart();
			exit;
		}
		
		riding = true;
		instance_riding = target_id;
	}
	
	// reset target settings
	target_x = 0;
	target_y = 0;
	target_id = noone;
	target_reached = false;
}

// else, if mouse left pressed
else if (mouse_left_pressed)
{
	moving = true;
	
	// set the target position
	target_x = mouse_x;
	target_y = mouse_y;
	target_id = noone;
	
	// if the target is a lily pad
	var lilypad = instance_place(target_x, target_y, obj_lily_pad);
	if (lilypad != noone)
	{
		// if clicking on the lily pad already being ridin
		if (riding && instance_riding == lilypad)
		{
			moving = false;
			exit;
		}
		
		// find the distance the lily pad will travel during
		// the time it will take the player to reach it
		var travel_offset_x = (lilypad.velocity_x * move_to_target_time);
		var travel_offset_y = (lilypad.velocity_y * move_to_target_time);
				
		// update player target
		target_x = (lilypad.x + travel_offset_x);
		target_y = (lilypad.y + travel_offset_y);
		target_id = lilypad.id;
	}
	
	// reset riding
	riding = false;
	instance_riding = noone;
	
	// get the distance and speed to reach target
	var target_distance = point_distance(x, y, target_x, target_y);
	var target_speed = (target_distance / move_to_target_time);
	
	// get the angle (in degrees) to the target
	var angle = point_direction(x, y, target_x, target_y);
	
	// point towards the target
	image_angle = angle;
	
	// set the velocity so the target is reached in the set amount of time
	velocity_x = (dcos(angle) * (target_speed));
	velocity_y = (dsin(angle) * (target_speed) * -1);
}
