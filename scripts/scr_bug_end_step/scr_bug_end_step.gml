
if ( ! dying)
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
}
