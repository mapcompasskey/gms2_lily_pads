
if (dying)
{
	// increment score
	global.SCORE += 1;
	
	//instance_destroy();
	reposition = true;
}

// reposition if leaving the screen
if (velocity_x < 0 && bbox_right < 0)
{
	reposition = true;
}
else if (velocity_x > 0 && bbox_left > room_width)
{
	reposition = true;
}

if (velocity_y > 0 && bbox_top > room_height)
{
	reposition = true;
}
else if (velocity_y < 0 && bbox_bottom < 0)
{
	reposition = true;
}

if (reposition)
{
	// width and height of the instance
	var wd = (bbox_right - bbox_left);
	var hg = (bbox_bottom - bbox_top);
	
	// set min/max values
	var rnd_speed = random_range(speed_min, speed_max);
	
	var min_x = (wd * 2);
	var max_x = (room_width - min_x);
	
	var min_y = (hg * 2);
	var max_y = (room_height - min_y);
	
	var target_x = 0;
	var target_y = 0;
		
	// move off screen
	switch (irandom_range(0, 3))
	{
		// left of screen
		case 0:
			x = (wd * -4);
			y = random_range(min_y, max_y);
			
			target_x = room_width;
			target_y = random_range(min_y, max_y);
			
			break;
			
		// right of screen
		case 1:
			x = (room_width + (wd * 4));
			y = random_range(min_y, max_y);
			
			target_x = 0;
			target_y = random_range(min_y, max_y);
			
			break;
			
		// top of screen
		case 2:
			x = random_range(min_x, max_x);
			y = (hg * -4);
			
			target_x = random_range(min_x, max_x);
			target_y = room_height;
			
			break;
			
		// bottom of screen
		case 3:
			x = random_range(min_x, max_x);
			y = (room_height + (hg * 4));
			
			target_x = random_range(min_x, max_x);
			target_y = 0;
			
			break;
	}
	
	// get the angle (in degrees) to the target
	var angle = point_direction(x, y, target_x, target_y);
	
	// point towards the target
	image_angle = angle;
	
	// update the velocity based on the travel vector
	velocity_x = (dcos(angle) * (rnd_speed));
	velocity_y = (dsin(angle) * (rnd_speed) * -1);
	
	// reset states
	dying = false;
	reposition = false;
}
