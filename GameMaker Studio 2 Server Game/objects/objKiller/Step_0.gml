/// @desc Player Collision

if (place_meeting(x,y,objPlayer))
{
	with(objPlayer)
	{
		x = xstart;
		y = ystart;
	}
}