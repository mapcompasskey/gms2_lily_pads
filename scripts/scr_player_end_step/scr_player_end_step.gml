
/*
// apply movement friction
if (move_friction > 0)
{
    if (abs(velocity_x * move_friction) < move_friction_min)
    {
        velocity_x = 0;
    }
    velocity_x = (velocity_x * move_friction);
}

// apply horizontal restrictions
if (max_velocity_x != 0)
{
    velocity_x = clamp(velocity_x, -max_velocity_x, max_velocity_x);
}
    
// apply vertical restrictions
if (max_velocity_y != 0)
{
    velocity_y = clamp(velocity_y, -max_velocity_y, max_velocity_y);
}
*/

/** /
if (move_to_target)
{
	// new x/y positions
	mx = velocity_x;
	my = velocity_y;
}
else
{
	// new x/y positions
	mx = (velocity_x * global.TICK);
	my = (velocity_y * global.TICK);
}
/**/

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
