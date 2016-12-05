
if (dying)
{
	// increment score
	global.SCORE += 1;
	
	//instance_destroy();
	
	reposition = true;
}

if (key_left && x < 0)
{
	show_debug_message("left side");
	reposition = true;
}
else if (key_right && x > room_width)
{
	show_debug_message("right side");
	reposition = true;
}

if (key_down && y > room_height)
{
	show_debug_message("bottom side");
	reposition = true;
}
else if (key_up && y < 0)
{
	show_debug_message("top side");
	reposition = true;
}

if (reposition)
{
	// width and height of the instance
	var wd = (bbox_right - bbox_left);
	var hg = (bbox_bottom - bbox_top);
	
	var min_x = (wd * 2);
	var max_x = (room_width - min_x);
	
	var min_y = (hg * 2);
	var max_y = (room_height - min_y);
	
	key_left = false;
	key_right = false;
	key_up = false;
	key_down = false;
		
	// move off screen
	switch (irandom_range(0, 3))
	{
		// left of screen
		case 0:
			show_debug_message("go right");
			key_right = true;
			speed_x = random_range(20, 30);
			speed_y = 0;
			x = 0;
			y = (room_height/2);
			break;
			
		// right of screen
		case 1:
			show_debug_message("go left");
			key_left = true;
			speed_x = random_range(20, 30);
			speed_y = 0;
			x = room_width;
			y = (room_height/2);
			break;
			
		// top of screen
		case 2:
			show_debug_message("go down");
			key_down = true;
			speed_x = 0;
			speed_y = random_range(20, 30);
			x = (room_width/2);
			y = 0;
			break;
			
		// bottom of screen
		case 3:
			show_debug_message("go up");
			key_up = true;
			speed_x = 0;
			speed_y = random_range(20, 30);
			x = (room_width/2);
			y = room_height;
			break;
	}
	
	// reset velocity
	velocity_x = 0;
	velocity_y = 0;
	
	// update horizontal velocity
	if (key_left)
	{
		velocity_x = speed_x * global.LEFT;
	}
	else if (key_right)
	{
		velocity_x = speed_x * global.RIGHT;
	}
	
	// update vertical velocity
	if (key_down)
	{
		velocity_y = speed_y * global.DOWN;
	}
	else if (key_up)
	{
		velocity_y = speed_y * global.UP;
	}
	
	// get the angle (in degrees) to the target
	var angle = point_direction(x, y, (x + velocity_x), (y + velocity_y));

	// point towards the target
	image_angle = angle;
	
	// update the velocity based on the travel vector
	velocity_x = (dcos(angle) * (speed_x));
	velocity_y = (dsin(angle) * (speed_y) * -1);
	
	// reset states
	dying = false;
	reposition = false;
}

/*
// if moving to right side of the screen
if (velocity_x > 0)
{
	//if (bbox_left > room_width)
	if (x > room_width)
	{
		show_debug_message("off right");
		reposition = true;
	}
}

// else, if moving to the left side of the screen
else if (velocity_x < 0)
{
	//if (bbox_right < 0)
	if (x < 0)
	{
		show_debug_message("off left");
		reposition = true;
	}
}

// if moving to the bottom of the screen
if (velocity_y > 0)
{
	//if (bbox_top > room_height)
	if (y > room_height)
	{
		show_debug_message("off bottom");
		reposition = true;
	}
}

// if moving to the top of the screen
else if (velocity_y < 0)
{
	//if (bbox_bottom < 0)
	if (y < 0)
	{
		show_debug_message("off top");
		reposition = true;
	}
}


if (reposition)
{
	// width and height of the instance
	var wd = (bbox_right - bbox_left);
	var hg = (bbox_bottom - bbox_top);
	
	var min_x = (wd * 2);
	var max_x = (room_width - min_x);
	
	var min_y = (hg * 2);
	var max_y = (room_height - min_y);
	
	// move off screen
	switch (irandom_range(0, 3))
	{
		// left of screen
		case 0:
			show_debug_message("0");
			x = 0;//(0 - wd);
			y = random_range(min_y, max_y);
			
			speed_x = random_range(20, 30);
			speed_y = 0;
			
			velocity_x = speed_x * global.RIGHT;
			velocity_y = speed_y;
			
			break;
			
		// right of screen
		case 1:
			show_debug_message("1");
			x = room_width;//(room_width + wd);
			y = random_range(min_y, max_y);
			
			speed_x = random_range(20, 30);
			speed_y = 0;
			
			velocity_x = speed_x * global.LEFT;
			velocity_y = speed_y;
			
			break;
			
		// top of screen
		case 2:
			show_debug_message("2");
			x = random_range(min_x, max_x);
			y = 0;//(0 - hg);
			
			speed_x = 0
			speed_y = random_range(20, 30);
			
			velocity_x = speed_x;
			velocity_y = speed_y * global.DOWN;
			
			break;
			
		// bottom of screen
		case 3:
			show_debug_message("3");
			x = random_range(min_x, max_x);
			y = room_height;//(room_height + hg);
			
			speed_x = 0
			speed_y = random_range(20, 30);
			
			velocity_x = speed_x;
			velocity_y = speed_y * global.UP;
			
			break;
	}
	
	// get the angle (in degrees) to the target
	var angle = point_direction(x, y, (x + speed_x), (y + speed_y));

	// point towards the target
	image_angle = angle;
	
	// update the velocity based on the travel vector
	velocity_x = (dcos(angle) * (speed_x));
	velocity_y = (dsin(angle) * (speed_y) * -1);
	
	// reset states
	dying = false;
	reposition = false;
}
*/
