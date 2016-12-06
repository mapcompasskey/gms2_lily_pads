
// store velocities
last_velocity_x = velocity_x;
last_velocity_y = velocity_y;

// if riding a lily pad
if (riding && instance_riding != noone)
{
	if (instance_exists(instance_riding))
	{
		// add the lily pad's velocity to the player instance
		velocity_x += instance_riding.velocity_x;
		velocity_y += instance_riding.velocity_y;
	}
}

// new x/y positions
mx = (velocity_x * global.TICK);
my = (velocity_y * global.TICK);

// check if the target will be overshot
if (moving)
{
	var target_overshot = false;
	
	// if moving left
	if (mx > 0 && (x + mx) > target_x)
	{
		target_overshot = true;
	}
	// else, if moving right
	else if (mx < 0 && (x + mx) < target_x)
	{
		target_overshot = true;
	}
	
	// if moving down
	if (my > 0 && (y + my) > target_y)
	{
		target_overshot = true;
	}
	// else, if moving up
	else if (my < 0 && (y + my) < target_y)
	{
		target_overshot = true;
	}
	
	// if the target was overshot
	if (target_overshot)
	{
		moving = false;
		target_reached = true;
		
		// update movement variables
		mx = (target_x - x);
		my = (target_y - y);
	}
}

// update position
x += mx;
y += my;

// game is over if leaving the room
if (bbox_right < 0)
{
	game_restart();
	//x = room_width;
}
