
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
if (bbox_right < -wd)
{
	x = (room_width + wd);
}

var hg = (bbox_bottom - bbox_top);
if (bbox_top > room_height)
{
	y = -hg;
}
