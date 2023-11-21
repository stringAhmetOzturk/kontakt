import User from "../models/user.js"

export const getAllUser = async (req,res) => {
    try {
        const users = await User.find() 
        res.status(201).send(users)
    } catch (error) {
        console.log(error)
        res.status(501).send("Error!")
    }
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