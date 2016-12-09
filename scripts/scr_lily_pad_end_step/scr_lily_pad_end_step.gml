
if (is_active)
{
	// store velocities
	last_velocity_x = velocity_x;
	last_velocity_y = velocity_y;

	// new x/y positions
	mx = (velocity_x * global.TICK);
	my = (velocity_y * global.TICK);

	// update position
	x += mx;
	y += my;

	// wrap instance back around into the room
	var wd = (bbox_right - bbox_left);
	var hg = (bbox_bottom - bbox_top);
	if (bbox_right < 0)
	{
		x = (room_width + wd);
		y = (starting_y + random_range((hg / -2), (hg / 2)));
		
		// if this instance is the turtle
		if (id == global.TURTLE)
		{
			// if the deactivated lily pad exists
			if (global.TURTLE_ACTIVE_AS != noone && instance_exists(global.TURTLE_ACTIVE_AS))
			{
				// deactivate the turtle
				is_active = false;
				
				// activate the lily pad
				global.TURTLE_ACTIVE_AS.is_active = true;
				global.TURTLE_ACTIVE_AS = noone;
			}
		}
		
		// if the turtle is not active
		else if (global.TURTLE_ACTIVE_AS == noone)
		{
			// 60% chance to be a turtle
			if (random_range(1, 10) > 6)
			{
				// if the turtle exists
				if (global.TURTLE != noone && instance_exists(global.TURTLE))
				{
					// deactivate this lily pad
					is_active = false;
					global.TURTLE_ACTIVE_AS = id;
				
					// position and activate the turtle
					global.TURTLE.is_active = true;
					global.TURTLE.x = x;
					global.TURTLE.y = y;
				}
			}
		}
		
	}
	
}
