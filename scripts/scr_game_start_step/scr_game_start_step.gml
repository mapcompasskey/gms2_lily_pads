
// there's 1,000,000 microseconds in 1 second
// at 60fps, delta_time should be around 16,666 microseconds (1000000/60 = 16666)
// at 30fps, delta_time should be around 33,333 microseconds
// at 10fps, delta_time should be around 100,000 microseconds

// convert the amount of microseconds that have passed since the last step to seconds
var dt = (1/1000000 * delta_time);

// limit TICK to 8fps: (1 / 1,000,000) * (1,000,000 / 8) = 0.125
global.TICK = min(0.125, dt);
