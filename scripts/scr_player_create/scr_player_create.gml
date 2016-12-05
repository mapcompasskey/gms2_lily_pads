
// movement
mx = 0;
my = 0;

speed_x = 50;
speed_y = 50;

velocity_x = 0;
velocity_y = 0;

last_velocity_x = 0;
last_velocity_y = 0;

// target movement
target_x = 0;
target_y = 0;
target_id = noone;
target_reached = false;
move_to_target_time = 0.5; // half a second

// states
moving = false;
riding = false;
dying = false;

// drawing
scale_x = 1.0;
scale_y = 1.0;

// inputs
key_left = false;
key_right = false;
key_up = false;
key_down = false;
mouse_left_pressed = false;

// start on a lily pad
//riding = true;
//instance_riding = instance_create_layer(x, y, global.ROOM_LAYER_LILY_PADS, obj_lily_pad);
