import User from "../models/user.js"
export const login = async (req,res) => {
    const { username, password } = req.body;
    try {
        const user = await User.findOne({ username: username, password: password })
        res.status(200).send(user)
    } catch (error) {
        console.log(error)
        res.status(501).send("Internal server error!")
    }
}
export const register = async (req,res) => {
    const username = req.body.username
    const password = req.body.password
    const email = req.body.email

    try {
        const user = User({
            username:username,
            password:password,
            email:email
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
