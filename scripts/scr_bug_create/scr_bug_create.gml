
// movement
mx = 0;
my = 0;

speed_x = 0; //random_range(5, 15);
speed_y = 0; //random_range(5, 15);

velocity_x = 0; //(speed_x * global.LEFT);
velocity_y = 0; //(speed_y * global.DOWN);

last_velocity_x = 0;
last_velocity_y = 0;

// set position and velocity at start
reposition = true;

// states
dying = false;

// inputs
key_left = false;
key_right = false;
key_up = false;
key_down = false;

/*
// get the angle (in degrees) to the target
var angle = point_direction(x, y, (x + velocity_x), (y + velocity_y));

// point towards the target
image_angle = angle;

// update the velocity based on the travel vector
velocity_x = (dcos(angle) * (speed_x));
velocity_y = (dsin(angle) * (speed_y) * -1);
*/
