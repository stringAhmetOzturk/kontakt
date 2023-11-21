import mongoose from "mongoose"

const roomSchema =  mongoose.Schema({
    name:{
        type:String,
        required:true
    },
    capacity:{
        type:Number,
        required:true
    }
})

const Room = mongoose.model("Room",roomSchema)
export default Room