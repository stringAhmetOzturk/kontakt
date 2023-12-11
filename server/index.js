//imports
import express from "express";
import cors from "cors";
import path,{ dirname } from "path"
import { fileURLToPath } from 'url';
import dotenv from "dotenv";
import http from "http";
import { Server } from "socket.io";
import mongoose from "mongoose";
import authRoute from "./routes/auth.js";
import roomRoute from "./routes/room.js";
import userRoute from "./routes/user.js";
import logger from "./controllers/logger.js"
//dotenv initialization.
dotenv.config();
//server created!
const app = express();
const server = http.createServer(app);
//mongo db connection
mongoose
  .connect(process.env.MONGO_URL)
  .then(() => {
    logger.log("info","Connected to db!");
  })
  .catch((error) => {
    logger.log("error",error);
  });
//middlewares initialization
app.use(cors());
app.use(express.json());

//static routes for admin
const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);
const infoLogPath = path.join(__dirname + "/logs" + "/info.log")
app.use(express.static(infoLogPath))
app.get('/api/logs/info', (req, res) => {
  //dosyayı açıp bir diziye çevir sonra yolla ki admin panelinde dizi olarak çekebil.
    res.sendFile(infoLogPath);
  });

//static routes for everyone


//routes initialization
app.use("/api/auth", authRoute);
app.use("/api/rooms", roomRoute);
app.use("/api/users", userRoute);
app.use(express.static(__dirname + "/logs/info.log"))
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
  logger.log("info","Server started at " + process.env.PORT);
});
