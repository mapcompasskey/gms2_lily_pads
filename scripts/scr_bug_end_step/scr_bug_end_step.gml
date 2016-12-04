
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
if (bbox_right < (0 - (wd * 2)))
{
	x = (room_width + wd);
}
else if (bbox_left > (room_width + (wd * 2)))
{
	x = (0 - wd);
}

var hg = (bbox_bottom - bbox_top);
if (bbox_bottom < (0 - (hg * 2)))
{
	y = (room_height + hg);
}
else if (bbox_top > (room_height + (hg * 2)))
{
	y = (0 - hg);
}
