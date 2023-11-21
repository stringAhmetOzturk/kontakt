import User from "../models/user.js"
export const login = async (req,res) => {
    res.status(200).send("Tested login")
}
export const register = async (req,res) => {
    try {
        const user = User({
            name:"Ahmet",
            username:"ahmet34"
        })
        await user.save()
        res.status(200).send(user)
    } catch (error) {
        console.log(error)
        res.status(501).send("Internal server error!")
    }
}
export const logout = async (req,res) => {
    res.status(200).send("Tested logout ")
}
