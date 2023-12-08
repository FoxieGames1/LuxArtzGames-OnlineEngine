
// Importing the required modules
const WebSocketServer = require('ws');

// Creating a new websocket server
const wss = new WebSocketServer.Server({ port: 3000 })

var Players = [];
var ClientID = 0;
var VERSION = "1.0"

function stateUpdate()
{
    for(let i in Players)
    {
        var PlayerInfo = {
            ID : Players[i].ID,
            x : Players[i].x,
            y : Players[i].y,
            name : Players[i].Name,
            EventName : "StateUpdate"
        }

        for(let j in Players)
        {
            Players[j].SocketObject.send(JSON.stringify(PlayerInfo))
        }
    }

    setTimeout(stateUpdate, 16)
}

stateUpdate();

wss.on("connection", ws => {
    ClientID++;

    ws.ClientID = ClientID

	//code that should execute just after the player connects
    console.log("A New Player is connected")

    //when the client sends us a message
    ws.on("message", data => {
        console.log(`Client has sent us: ${data}`);

        var RealData = JSON.parse(data);
        var EventName = RealData.EventName;

        switch(EventName)
        {
            case "create_player_request":
                var Player = {
                    ID: ClientID,
                    x: 0,
                    y: 0,
                    Sprite: 0,
                    
                    Name: RealData.Name,
                    SocketObject: ws,
                } 

                Players.push(Player);
                console.log(Players);

                ws.send(
                    JSON.stringify({
                        EventName: "CreateYou",
                        ID: ClientID,
                    })
                );
            break;

            case "position_update":
                var ThisClientID = RealData.ID

                for(let i in Players)
                {
                    if (Players[i].ID == ThisClientID)
                    {
                        Players[i].x = RealData.x;
                        Players[i].y = RealData.y;
                    }
                }
            break;
        }
    })
    // handling what to do when clients disconnects from server
    ws.on("close", () => { 
        console.log("A Player Has Disconnected");

        var WhoDisconnected = ws.ClientID;

        var StringToSend = {
            ID : WhoDisconnected,
            EventName : "PlayerDisconnected"
        }

        for(let i in Players)
        {
            Players[i].SocketObject.send(
                JSON.stringify(StringToSend)
            )

            if (Players[i].ID == WhoDisconnected)
            {
                Players.splice(i, 1)
            }
        }
    })

    // handling client connection error
    ws.onerror = function () {
        console.log("Some Error occurred");
    }

    // handling client connection error
    ws.onerror = function () {
        console.log("Some Error occurred");
    }
});

console.log("The WebSocket server is running");


