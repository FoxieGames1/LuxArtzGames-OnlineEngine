/// @desc Move
scrAntiGetStuck()

scrPlayer1Platform()

scrPlatformMovement()

scrPlatformCollision()

///START WITH DIRECTION
if (Start = false)
{
	switch(Direction)
	{
		case "Up":    DirectionReal = 090 Pattern = "Vertical" break;
		case "Down":  DirectionReal = 270 Pattern = "Vertical" break;
		case "Left":  DirectionReal = 180 Pattern = "Horizontal" break;
		case "Right": DirectionReal = 000 Pattern = "Horizontal" break;
		case "Circular": DirectionReal = 000 Pattern = "Circular" break;
	}
	Start = true
}

if (Speed != 0)
{SaveSpeed = 0; ChangeTrayectory = false}