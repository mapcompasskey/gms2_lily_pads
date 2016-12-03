
// movement
mx = 0;
my = 0;

speed_x = 50;
speed_y = 50;

velocity_x = 0;
velocity_y = 0;

last_velocity_x = 0;
last_velocity_y = 0;

target_x = 0;
target_y = 0;
move_to_target = false;

//max_velocity_x = (speed_x * 2);
//max_velocity_y = (speed_y * 2);

//move_friction = 0;     // 0.9 - reduce by 10% every step
//move_friction_min = 0; // 1   - if less than 1

// states
dying = false;
hurting = false;
jumping = false;
falling = false;

// drawing
scale_x = 1.0;
scale_y = 1.0;

// inputs
key_left = false;
key_right = false;
key_up = false;
key_down = false;


move_time = 4; // 1 second
move_timer = 0;
move_counter = 0;

delta_counter = 0;

