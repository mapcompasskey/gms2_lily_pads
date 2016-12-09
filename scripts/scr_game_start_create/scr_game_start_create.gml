
// this object must be persistent
if ( ! persistent)
{
    persistent = true;
}

// global instances
global.TURTLE = noone;
global.TURTLE_ACTIVE_AS = noone;

// global parameters
global.RIGHT = 1;
global.LEFT = -1;
global.UP = -1;
global.DOWN = 1;
global.TICK = 0;
global.SCORE = 0;

// room layer names
global.ROOM_LAYER_CONTROLLERS = "Controllers";
global.ROOM_LAYER_BUGS = "Bugs";
global.ROOM_LAYER_PLAYER = "Player";
global.ROOM_LAYER_LILY_PADS = "LilyPads";

// input keys to listen for
// *set as globals so they can be remapped
global.KEY_LEFT = ord("A"); //vk_left;
global.KEY_RIGHT = ord("D"); //vk_right;
global.KEY_UP = ord("W"); //vk_up;
global.KEY_DOWN = ord("S"); //vk_down;
global.KEY_ESCAPE = vk_escape;
global.KEY_ENTER = vk_enter;

