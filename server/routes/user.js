import express from "express"
import {getAllUser,getUser,deleteUser,updateUser} from "../controllers/user.js"
const router = express.Router()

router.get("/getAllUser",getAllUser)
router.get("/getUser/:id",getUser)
router.delete("/deleteUser/:id",deleteUser)
router.put("/updateUser/:id",updateUser)

export default router