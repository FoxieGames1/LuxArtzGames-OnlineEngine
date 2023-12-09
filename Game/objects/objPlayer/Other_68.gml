///@desc Networking Works with Heroku

switch(async_load[? "type"])
{
	case network_type_non_blocking_connect:
		var Buffer = buffer_create(1, buffer_grow ,1);
		var data = ds_map_create();
		data[? "EventName"] = "create_player_request";
		data[? "Name"] = get_string("Enter name", "no name")
	
		buffer_write(Buffer, buffer_text, json_encode(data));
		network_send_raw(Socket, Buffer, buffer_tell(Buffer));
		ds_map_destroy(data);
	break;
	
	case network_type_data:
		var buffer_raw = async_load[? "buffer"];
		var buffer_processed = buffer_read(buffer_raw, buffer_text);
		var RealData = json_decode(buffer_processed);
		var EventName = RealData[? "EventName"]
		
		switch(EventName)
		{
			case "CreateYou":
				global.ClientID = real(RealData[? "ID"])
			break;
			
			case "StateUpdate":
				var OtherID = real(RealData[? "ID"]);
				var OtherX = real(RealData[? "x"]);
				var OtherY = real(RealData[? "y"]);
				var OtherSprite = real(RealData[? "Sprite"]);
				var OtherImgIndex = real(RealData[? "ImgIndex"]);
				var OtherImgSpeed = real(RealData[? "ImgSpeed"]);
				
				//You can delete this in case the player doesnt have an tail in game
				var OtherImgIndexTail = real(RealData[? "ImgIndexTail"]);
				var OtherImgSpeedTail = real(RealData[? "ImgSpeedTail"]);
				
				var Found = false
				with(objOtherPlayer)
				{
					if (OtherID == OtherPlayerID)
					{
						Found = true
						x = OtherX;
						y = OtherY;
						sprite_index = OtherSprite
						image_index = OtherImgIndex;
						image_speed = OtherImgSpeed;
						
						//You can delete this in case the player doesnt have an tail in game
						ImageIndex = OtherImgIndexTail;
						ImageSpeed = OtherImgSpeedTail;
					}
				}
				
				if (!Found)
				{
					if (real(RealData[? "ID"]) != global.ClientID)
					{
						var Player = instance_create_depth(x,y,0,objOtherPlayer);
						Player.OtherPlayerID = real(RealData[? "ID"]);
					}
				}
			break;
			
			case "PlayerDisconnected":
				with(objOtherPlayer){
					if (OtherPlayerID == real(RealData[? "ID"]))
					{
						instance_destroy(id)	
					}
				}
			break;
		}
	break;
}