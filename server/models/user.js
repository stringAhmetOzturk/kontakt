import mongoose from "mongoose"

const userSchema = mongoose.Schema({
    name:{
        type:String,
        required:true
    },
    username:{
        type:String,
        required:true
    },
    totalPoints:{
        type:Number,
        default:0
    }
})

const User = mongoose.model("User",userSchema)

export default User