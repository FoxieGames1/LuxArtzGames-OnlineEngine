/// @description Basic Player actions
scrAntiGetStuck(objWall)

if global.PlayerStop=false
{
	kright	= global.KeyRight || global.JoyRight
	kleft	= global.KeyLeft  || global.JoyLeft
	kdown	= global.KeyDown  || global.JoyDown
	kup		= global.KeyUp    || global.JoyUp

	xaxis	= kright - kleft
	yaxis	= kdown - kup
}

// CheckGrounds
if (on_ground() && yvel=0)
{
	if ground=false{ground=true;}
}
else
if (!on_ground())
{
	ground=false
}

// Calculate speeds
if abs(xaxis)
{
	if (on_ground())
	{
		if (!Ice)
		{
			if (xaxis != 0){xvel = approach(xvel, xvel_max * xaxis, xAccGround)}
		}
		else
		if (Ice)
		{
			if (xaxis != 0){xvel = approach(xvel, xvel_max * xaxis, xAccIce)}
		}
		
	}
	else
	if (!on_ground())
	{
		if (xaxis != 0){xvel = approach(xvel, xvel_max * xaxis, xAccAir)}
	}
	XS = xaxis
}
else
{
	if (on_ground())
	{
		if (!Ice)
		{
			if (xaxis = 0){xvel = approach(xvel, xvel_max * xaxis, xFricGround)}
		}
		else
		if (Ice)
		{
			if (xaxis = 0){xvel = approach(xvel, xvel_max * xaxis, xFricIce)}
		}
	}
	else
	if (!on_ground())
	{
		if (xaxis = 0){xvel = approach(xvel, xvel_max * xaxis, xFricAir)}
	}	
}
	
// Simple State Machine
var _state_current	= state_current
script_execute(state_current)
state_is_new		= _state_current != state_current
state_timer			= state_is_new ? 0 : state_timer + 1

// Movement after all state calculations
round_vel()

// Let the instance decide what to do when it can't move
if !move_x(xvel_int, true)
{
    xvel       = 0
    xvel_fract = 0
}

if !move_y(yvel_int)
{
    yvel       = 0
    yvel_fract = 0
}

// Animations
if jump_frame = false
{
	if (xaxis  = 0 && ground = true){sprite_index=sprFoxieIdle SpriteTail = sprFoxieTailIdle ImageIndex = 0 image_speed=0.2}
	if (xaxis != 0 && ground = true){sprite_index=sprFoxieWalk SpriteTail = sprFoxieTailRun image_speed=0.35}
	if (yvel < 0 && ground = false){sprite_index=sprFoxieJump  SpriteTail = sprFoxieTailRun image_speed=0.0}
	if (yvel > 0 && ground = false){sprite_index=sprFoxieFall  SpriteTail = sprFoxieTailRun image_speed=0.0}
}
else
if jump_frame = true
{
	sprite_index=sprFoxieJump image_speed=0.0
	jump_frame = false
}

// Collision with Platform
scrPlatformPlayerExtra()

// Collision with Ice
Ice = place_meeting(x,y+1,objIceWall);

// Collision with One-Way Platform
var JumpThrough = instance_place(x, y + 1,objJumpthrough);
var MovingJumpThrough = instance_place(x, y + 1,objMovingJumpThrough)
var Speed = 0;

if (instance_exists(JumpThrough))
{
	if (JumpThrough && !place_meeting(x, y + 1, objSolid))
	{
		if (kdown && global.KeyJumpP)
		{
			if (PassDownPlatforms = false)
			{
				if (instance_exists(MovingJumpThrough))
				{
					Speed = MovingJumpThrough.Speed;
					PassDownSpeed = Speed
					if (MovingJumpThrough.DirectionReal = 270)
					{
						y += 4 + PassDownSpeed
					}
				}
				y += 1
				alarm[0] = 2
				PassDownPlatforms = true
			}
		}
	}
}

var Colision = instance_place(x,y,objMovingJumpThrough)

if (Colision)
{
	return false	
}


// When collision with the Circular moving platform this will be fixed
y = ceil(y)

// If you fall from a one-way platform this value goes 0
if (ground = true)
{
	PassDownPlatforms = 0;
	PassDownSpeed = 0;
}

//Update Position to the server with Heroku
var Buffer = buffer_create(1, buffer_grow ,1);
var data = ds_map_create();
data[? "EventName"] = "position_update";
data[? "ID"] = global.ClientID
data[? "x"] = x
data[? "y"] = y
data[? "Sprite"] = sprite_index
data[? "ImgIndex"] = image_index
data[? "ImgSpeed"] = image_speed
data[? "XScale"] = XS
data[? "YScale"] = YS

//You can delete this in case the player doesnt have an tail in game
data[? "ImgIndexTail"] = ImageIndex
data[? "ImgSpeedTail"] = ImageSpeed
data[? "SpriteTail"] = SpriteTail

buffer_write(Buffer, buffer_text, json_encode(data));
network_send_raw(Socket, Buffer, buffer_tell(Buffer));
ds_map_destroy(data);

