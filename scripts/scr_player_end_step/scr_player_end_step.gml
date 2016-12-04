
// store velocities
last_velocity_x = velocity_x;
last_velocity_y = velocity_y;

// new x/y positions
mx = (velocity_x * global.TICK);
my = (velocity_y * global.TICK);

// check if the target will be overshot
if (move_to_target)
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
		move_to_target = false;
		moved_to_target = true;
		mx = (target_x - x);
		my = (target_y - y);
	}
}

// update position
x += mx;
y += my;

// keep instance inside the room
if (bbox_right < 0)
{
    x = (room_width - (bbox_right - bbox_left));
}
else if (bbox_left > room_width)
{
    x = (bbox_right - bbox_left);
}

if (bbox_top > room_height)
{
    y = sprite_height;
}
