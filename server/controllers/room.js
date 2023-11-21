import Room from "../models/room.js"
//get all room
export const getAllRoom = async (req,res) => {
   try {
    const rooms = await Room.find()
    res.status(201).send(rooms)
   } catch (error) {
    console.log(error)
    res.status(501).send("Error")
   }
}
//get single room
export const getRoom = async (req,res) => {
    try {
        const id = req.params.id
        const room = await Room.findById(id)
        res.status(200).send(room)
    } catch (error) {
        console.log(error)
        res.status(501).send("Error")
    }
}
//create a room
export const createRoom = async (req,res) => {
    try {
        const room = new Room({name:"Oda 1",capacity:5})
        await room.save()
        res.status(201).send(room)
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
        res.status(201).send(`${id} deleted`)
    } catch (error) {
        console.error(error);
        res.status(500).send("Internal Server Error");
    }
}