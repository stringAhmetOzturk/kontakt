//imports
import express from "express"
import cors from "cors"
import dotenv from "dotenv"
import http from "http"
import mongoose, { mongo } from "mongoose"
import authRoute from "./routes/auth.js"
import roomRoute from "./routes/room.js"
import userRoute from "./routes/user.js"
//dotenv initialization.
dotenv.config()
//server created!
const app = express()
const server = http.createServer(app)
//mongo db connection
mongoose.connect(process.env.MONGO_URL).then(()=>{console.log("Conneceted to db!")}).catch((error)=>{
    console.log(error)
})
//middlewares initialization
app.use(cors())
//routes initialization
app.use("/api/auth",authRoute)
app.use("/api/rooms",roomRoute)
app.use("/api/users",userRoute)
//server started!
server.listen(process.env.PORT || 5000,()=>{
    console.log("Server started at " + process.env.PORT)
})



