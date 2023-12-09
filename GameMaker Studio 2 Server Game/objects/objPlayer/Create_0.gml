/// @description Basic player object
image_speed = 0
ImageIndex = 0;
ImageSpeed = 0.1;
SpriteTail = sprFoxieTailIdle

xaxis		= 0
yaxis		= 0

platformer_init()

Ice = false;

xvel_max = 2.23;
xAccGround = 0.5
xFricGround = 0.5
xAccIce = 0.05
xFricIce = 0.01
xAccAir = 0.25
xFricAir = 0

state_current = playerStateGround
state_is_new  = true
state_timer	  = 0

ground = false;

jump_cooldown       = false
jump_frame			= false
jump_speed          = 4.2
grav                = 0.17
terminal_velocity   = 7

XS=1
YS=1

xScale = 1;
yScale = 1;

U = false
D = false
L = false
R = false

Gummy = false
PassDownPlatforms = false;
PassDownSpeed = 0;

//Server Conection with Heroku

/*
－ＩＮ  ＨＥＲＯＫＵ－
１.- Go to Heroku Dashboard
２.- Settigs
３.- Domains

－ＩＮ  ＧＭＳ２－
１.- Copy and Paste This: "https://your-server-IDOfTheServer.herokuapp.com/"
２.- Delete: "https:// & / in to the end of the text
３.- Set the port to 443 and there is.
４.- And set "network_socket_ws" to "network_socket_wss"

and that's it your server now is 24/7 if you followed my tutorial steps.
*/

Socket = network_create_socket(network_socket_wss);
network_connect_raw_async(Socket, "your-server-IDOfTheServer.herokuapp.com", 443)