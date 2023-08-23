const mongoose = require('mongoose');
const roomSchema = new mongoose.Schema({
    word: {
        required: true,
        type: String
    },
    name: {
        required: true,
        type: String,
        unique: true,
        trim: true,
    },
    occupancy: {
        required: true,
        type: Number,
        default: 2
    },
    maxRounds: {
        required: true,
        type: Number
    },
    currentRound: {
        required: true,
        type: Number,
        default: 1
    },
    players: [playerSchema],
    isJoined: {
        type: Boolean,
        default: true
    },
    turn: playerScema,
    turnIndex:{
        type: Number,
        default: 0
    }
})
const gameModel = mongoose.model('Room', roomSchema);
module.exports = gameModel;
// Rooms:
// -ID 
// - RoomName
//      - word
//      - occupancy
//      - max rounds