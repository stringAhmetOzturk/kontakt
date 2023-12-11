import Room from "../models/room.js"
//get all room
export const getAllRoom = async (req,res) => {
   try {
    const rooms = await Room.find()
    res.status(200).send(rooms)
   } catch (error) {
    console.log(error)
    res.status(501).send("Error")
   }
}
//get single room
export const getRoom = async (req,res) => {
    try {
        const roomId = req.params.id
        const room = await Room.findById(roomId)
        res.status(200).send(room)
    } catch (error) {
        console.log(error)
        res.status(501).send("Error")
    }
}
//create a room
export const createRoom = async (req,res) => {
    const ownerName = req.body.ownerName
    const ownerId = req.body.ownerId
    const capacity = req.body.capacity
    const roomName = req.body.roomName
    try {
        const room = new Room({roomName:roomName,capacity:capacity,ownerName:ownerName,ownerId:ownerId,users:[{userName:ownerName,userId:ownerId}]})
        await room.save()
        res.status(200).send(room)
    } catch (error) {
        console.error(error);
        res.status(500).send("Internal Server Error");
    }
}
//delete a room
export const deleteRoom = async (req,res) => {
    try {
        const id = req.params.id
        await Room.deleteOne({id})
        res.status(200).send(`${id} deleted`)
    } catch (error) {
        console.error(error);
        res.status(500).send("Internal Server Error");
    }
}