import express from "express"
import {getAllRoom,getARoom,createRoom,deleteRoom} from "../controllers/room.js"
const router = express.Router()

router.get("/getAllRoom",getAllRoom)
router.get("/getRoom/:id",getARoom)
router.post("/createRoom",createRoom)
router.delete("/deleteRoom",deleteRoom)

export default router