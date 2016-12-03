
// this object must be persistent
if ( ! persistent)
{
    persistent = true;
}

game_set_speed(60, gamespeed_fps);

global.PLAYER = noone;
global.RIGHT = 1;
global.LEFT = -1;
global.UP = -1;
global.DOWN = 1;
global.TICK = 0;

// input keys to listen for
// *set as globals so they can be remapped
global.KEY_LEFT = vk_left;
global.KEY_RIGHT = vk_right;
global.KEY_UP = vk_up;
global.KEY_DOWN = vk_down;
global.KEY_ESCAPE = vk_escape;
global.KEY_ENTER = vk_enter;

