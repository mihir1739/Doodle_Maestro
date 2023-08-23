require('dotenv').config();
const express = require("express")
var http = require("http")
const Room = require('./models/Room');
const app = express();
const port = process.env.PORT || 3000;
var server = http.createServer(app);
const mongoose =  require("mongoose");
var io = require("socket.io")(server);
const username = process.env.USERNAME;
const password = process.env.PASSWORD;
const DB = `mongodb+srv://${username}:${password}@doodlemaestro.es5vzhh.mongodb.net/?retryWrites=true&w=majority`
mongoose.connect(DB).then(() => {
    console.log("Connection Succesfull");
}).catch((e) => {
    console.log(e);
})
io.on("connection", (socket) => {
    console.log("connected");
    socket.on("create-game",async ({nickname, name, accuracy, maxRounds}) => {
        try {
            const existingRoom = await Room.findOne({name});
            if(existingRoom) {
                socket.emit('notCorrectGame', 'Room with that Room Name already exists!');
                return;
            }
            let room = new Room();
            const word = getWord();
            room.word = word;
            room.name = name;
            room.occupancy = occupancy;
            room.maxRounds = maxRounds;

            let player = {
                socketID: socket.id,
                nickname,
                isPartyLeader: true,
            }
            room.players.push(player);
            room = await room.save();
            socket.join(name);
            io.to(name).emit('updateRoom', room);
        }
        catch {

        }
    })
})
server.listen(port, "0.0.0.0", () => {
    console.log("Server Started and Running on: "+ port);
})