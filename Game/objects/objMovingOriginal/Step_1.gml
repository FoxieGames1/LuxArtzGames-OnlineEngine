/// @desc move

round_vel()

if !move_platform_x(xvel_int)
{
    xvel       = -xvel
    xvel_fract = 0
}

if !move_platform_y(yvel_int)
{
    yvel       = -yvel
    yvel_fract = 0
}

if (place_meeting(x + sign(xvel),y,objBumper))
{
	 xvel *= -1
}

if (place_meeting(x,y + sign(yvel),objBumper))
{
	 yvel *= -1
}