export const getAllRoom = async (req,res) => {
    console.log("Test")
    res.status(200).send({"rooms":[{"id":1,"roomName":"Room 1"},{"id":2,"roomName":"Room 2"}]})
}
export const getARoom = async (req,res) => {
    res.status(200).send("Tested get one")
}
export const createRoom = async (req,res) => {
    res.status(200).send("Tested create ")
}
export const deleteRoom = async (req,res) => {
    res.status(200).send("Tested delete")
}