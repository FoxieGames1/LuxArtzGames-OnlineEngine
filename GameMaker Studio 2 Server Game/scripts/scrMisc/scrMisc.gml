function scrAntiGetStuck()
{
	var Solid = objWall;
	
	if(place_meeting(x, y, Solid)) //Anti GetStuck
	{
	    for(var i = 0; i < 1600; ++i)
		{
	        //Right
	        if(!place_meeting(x + i, y, Solid))
			{
	            x += i;
	            break;
	        }
	        //Left
	        if(!place_meeting(x - i, y, Solid))
			{
	            x -= i;
	            break;
	        }
	        //Up
	        if(!place_meeting(x, y - i, Solid))
			{
	            y -= i;
	            break;
	        }
	        //Down
	        if(!place_meeting(x, y + i, Solid))
			{
	            y += i;
	            break;
	        }
	        //Top Right
	        if(!place_meeting(x + i, y - i, Solid))
			{
	            x += i;
	            y -= i;
	            break;
	        }
	        //Top Left
	        if(!place_meeting(x - i, y - i, Solid))
			{
	            x -= i;
	            y -= i;
	            break;
	        }
	        //Bottom Right
	        if(!place_meeting(x + i, y + i, Solid))
			{
	            x += i;
	            y += i;
	            break;
	        }
	        //Bottom Left
	        if(!place_meeting(x - i, y + i, Solid))
			{
	            x -= i;
	            y += i;
	            break;
	        }
	    }
	}
}

function scrPlayer1Platform()
{
	var PlatformCollision = instance_place(x,y-2,objPlayer);

	//Collisions
	switch(Pattern)
	{
		case "Horizontal":
			if (place_meeting(x + Speed,y, objSolid) || place_meeting(x + Speed,y, objBumper))
			{
				if (instance_exists(PlatformCollision))
				{
					if (PlatformCollision.y <= y)
					{
						if (PlatformCollision)
						{PlatformCollision.x -= Speed}
					}
				}
			}
			else
			if (place_meeting(x - Speed,y, objSolid) || place_meeting(x - Speed,y, objBumper))
			{
				if (instance_exists(PlatformCollision))
				{
					if (PlatformCollision.y <= y)
					{
						if (PlatformCollision)
						{PlatformCollision.x += Speed}
					}
				}
			}
		break;
		case "Vertical":
			if (place_meeting(x,y + Speed, objSolid) || place_meeting(x,y + Speed, objBumper))
			{
				if (instance_exists(PlatformCollision))
				{
					if (PlatformCollision.y <= y)
					{
						if (PlatformCollision)
						{PlatformCollision.y = y}
					}
					
					if (SaveSpeed = 0)
					{
						SaveSpeed = Speed
						Speed = 0;
					}
					if (ChangeTrayectory = false)
					{alarm[0] = 1 ChangeTrayectory = true}
				}
			}
			else
			if (place_meeting(x,y - Speed, objSolid) || place_meeting(x,y - Speed, objBumper))
			{
				if (instance_exists(PlatformCollision))
				{
					if (PlatformCollision.y < y)
					{
						if (PlatformCollision)
						{
							PlatformCollision.y = y
						}
					}
				}
			}
		
			if (instance_exists(PlatformCollision))
			{
				if (DirectionReal > 0 && DirectionReal < 180)
				{
					if (PlatformCollision.y > y)
					{
						if (PlatformCollision.yvel > 0)
						{
							with(PlatformCollision)
							{
								if (PassDownPlatforms != 2)
								{
									if (PlatformCollision.y < other.y+8)
									{
										yvel = 0;
										PlatformCollision.y = other.y
										if(place_meeting(x, y, other)) //Anti GetStuck
										{
										    for(var I = 0; I < 32; ++I)
											{
												if(!place_meeting(x, y - I, other))
												{
										            y -= I;
										            break;
										        }
											}
										}
									}
								}
							}
						}
					}
					
					if (PlatformCollision)
					{
						if (PlatformCollision.yvel > 0)
						{
							if (PlatformCollision.y < y)
							{
								with(PlatformCollision)
								{
									if (PassDownPlatforms != 2)
									{
										if (!place_meeting(x,y+1,objSolid))
										{
											yvel = 0;
											PlatformCollision.y = other.y
										}
									}
								}
							}
						}
					}
				}
				else
				{
					if (PlatformCollision.y > y)
					{
						if (PlatformCollision.yvel > 0)
						{
							with(PlatformCollision)
							{
								if (PassDownPlatforms != 2)
								{
									if (PlatformCollision.y < other.y+8)
									{
										yvel = 0;
										PlatformCollision.y = other.y
										if(place_meeting(x, y, other)) //Anti GetStuck
										{
											for(var I = 0; I < 32; ++I)
											{
											    if(!place_meeting(x, y - I, other))
												{
											        y -= I;
											        break;
												}
											}
										}
									}
								}
							}
						}
					}
					
					if (PlatformCollision)
					{
						if (PlatformCollision.yvel > 0)
						{
							if (PlatformCollision.y < y)
							{
								with(PlatformCollision)
								{
									if (PassDownPlatforms != 2)
									{
										if (!place_meeting(x,y+1,objSolid))
										{
											yvel = 0;
											PlatformCollision.y = other.y
										}
									}
								}
							}
						}
					}
				}
			}
		break;
		case "Circular":
			if (instance_exists(PlatformCollision))
			{
				if (PlatformCollision.y < y+1)
				{
					if (PlatformCollision)
					{
						PlatformCollision.y = y
					}
				}
			}
		break
	}

	if (instance_exists(PlatformCollision))
	{
		if (PlatformCollision.y <= y)
		{
			if (PlatformCollision.yvel >= 0)
			{
				switch(Pattern)
				{
					case "Horizontal":
						PlatformCollision.x += lengthdir_x(Speed, DirectionX)
					break;
					case "Vertical":
						with(PlatformCollision)
						{
							if (!place_meeting(x,y+1,objSolid))
							{PlatformCollision.y += lengthdir_y(other.Speed, other.DirectionY)}
						}
					break;
					case "Circular":
						PlatformCollision.x += lengthdir_x(Speed, DirectionX)
						with(PlatformCollision)
						{
							if (!place_meeting(x,y+1,objSolid))
							{PlatformCollision.y += lengthdir_y(other.Speed, other.DirectionY)}
						}
					break;
				}
			}
		}
	}
}

function scrPlatformMovement()
{
	switch(Pattern)
	{
		case "Horizontal":
			x += lengthdir_x(Speed, DirectionX)
		
			DirectionX = clamp(DirectionX, DirectionReal, DirectionReal)
			DirectionY = clamp(DirectionY, DirectionReal, DirectionReal)
		break;
		case "Vertical":
			y += lengthdir_y(Speed, DirectionY)
		
			DirectionX = clamp(DirectionX, DirectionReal, DirectionReal)
			DirectionY = clamp(DirectionY, DirectionReal, DirectionReal)
		break;
		case "Circular":
			x += lengthdir_x(Speed, DirectionX)
			y += lengthdir_y(Speed, DirectionY)
		
			DirectionX += Speed
			DirectionY += Speed
		
			if (DirectionX < -360){DirectionX += 360;}
			if (DirectionY < -360){DirectionY += 360;}
		
			if (DirectionX > 360){DirectionX -= 360;}
			if (DirectionY > 360){DirectionY -= 360;}
		break;
	}	
}

function scrPlatformCollision()
{
	//Collisions
	switch(Pattern)
	{
		case "Horizontal":
			if (place_meeting(x + Speed,y, objSolid) || place_meeting(x + Speed,y, objBumper))
			{
				if (DirectionReal != 180)
				{
					DirectionReal = 180
				}
			}
			else
			if (place_meeting(x - Speed,y, objSolid) || place_meeting(x - Speed,y, objBumper))
			{
				if (DirectionReal != 0)
				{
					DirectionReal = 0
				}
			}
		break;
		case "Vertical":
			if (place_meeting(x,y + Speed, objSolid) || place_meeting(x,y + Speed, objBumper))
			{
				if (DirectionReal != 90)
				{
					DirectionReal = 90
				}
			}
			else
			if (place_meeting(x,y - Speed, objSolid) || place_meeting(x,y - Speed, objBumper))
			{
				if (DirectionReal != 270)
				{
					DirectionReal = 270
				}
			}
		break;
	}
}

function scrPlatformPlayerExtra()
{
	if (PassDownPlatforms != 2)
	{
		if (yvel >= 0)
		{
			var _platform = instance_place(x, y, objMovingJumpThrough)
			if (_platform != noone)
			{
				if (bbox_bottom <= _platform.bbox_top)
				{
					yvel = 0;
					ground = true;
					return true;
				}
			}
		}
	}
}