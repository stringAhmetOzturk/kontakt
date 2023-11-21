import express from "express"
import {getAllRoom,getRoom,createRoom,deleteRoom} from "../controllers/room.js"
const router = express.Router()

router.get("/getAllRoom",getAllRoom)
router.get("/getRoom/:id",getRoom)
router.post("/createRoom",createRoom)
router.delete("/deleteRoom/:id",deleteRoom)

export default router