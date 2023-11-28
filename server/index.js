//imports
import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import http from "http";
import { Server } from "socket.io";
import mongoose from "mongoose";
import authRoute from "./routes/auth.js";
import roomRoute from "./routes/room.js";
import userRoute from "./routes/user.js";
//dotenv initialization.
dotenv.config();
//server created!
const app = express();
const server = http.createServer(app);
//mongo db connection
mongoose
  .connect(process.env.MONGO_URL)
  .then(() => {
    console.log("Connected to db!");
  })
  .catch((error) => {
    console.log(error);
  });
//middlewares initialization
app.use(cors());
app.use(express.json());
//routes initialization
app.use("/api/auth", authRoute);
app.use("/api/rooms", roomRoute);
app.use("/api/users", userRoute);

//users on socket
var users = [];
//socket.io connection
const io = new Server(server);
io.on("connection", (socket) => {
  console.log("connected " + socket.id);
  socket.on("signin", (id) => {
    users.push({ userId: id, socketId: socket.id });
  });
  console.log(users);
});

//server started!
server.listen(process.env.PORT || 5000, () => {
  console.log("Server started at " + process.env.PORT);
});
