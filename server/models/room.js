import mongoose from "mongoose"
import User from "./user.js"

const roomSchema =  mongoose.Schema({
    roomName:{
        type:String,
        default:"New Room"
    },
    capacity:{
        type:Number,
        default:10
    },
    ownerName:{
        type:String,
        required:true
    },
    ownerId:{
        type:Number,
        required:true
    },
    createdAt:{
        type:Date,
        default:Date.now
    },
    roomTime:{
        type:Number,
        default:10
        //minutes
    },
    users:{
        type:Array,
        default:[]
    },
    words:{
        type:Array,
        default:[]
    },
    answerTime:{
        type:Number,
        default:7
        //seconds
    },
    wordHolder:{
        type:Number
    }
})

const Room = mongoose.model("Room",roomSchema)
export default Room