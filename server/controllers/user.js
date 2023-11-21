export const getAllUser = async (req,res) => {
    res.status(200).send("Tested get all")
}
export const getUser = async (req,res) => {
    res.status(200).send("Tested get one")
}
export const deleteUser = async (req,res) => {
    res.status(200).send("Tested delete ")
}
export const updateUser = async (req,res) => {
    res.status(200).send("Tested update")
}