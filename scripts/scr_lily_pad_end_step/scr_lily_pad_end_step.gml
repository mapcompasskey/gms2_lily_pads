
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
}
