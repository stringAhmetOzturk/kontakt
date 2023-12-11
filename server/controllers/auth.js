import logger from "./logger.js"
import User from "../models/user.js"
export const login = async (req,res) => {
    const { username, password } = req.body;
    if (username && password) {
        logger.log("info","Login req for user " + username)
        console.log("Login req for user " + username)
        try {
            const user = await User.findOne({ username: username})
            res.status(200).send(user)
            logger.log("info","Login res for user " + username)
            console.log("Login res for user " + username)
        } catch (error) {
            logger.log("error",error)
            console.log(error)
            res.status(501).send("Internal server error!")
        }
    }else{
        logger.log("info","Invalid req to login")
        console.log("Invalid req to login")
        res.status(404).send("Fill all the credentials")
    }
 
}
export const register = async (req,res) => {
    const { username, password, email } = req.body;
    console.log({ username, password, email })
    const existedUser = await User.find({$or:[{username : username},{password : password}]})
    if (existedUser.length > 0) {
        res.status(404).send("This user already exist!")
    }else{
        logger.log("info","Register req for user " + username)
        try {
            const user = User({
                username:username,
                password:password,
                email:email
            })
            await user.save()
            res.status(200).send(user)
            logger.log("info","Register res for user " + username)
        } catch (error) {
            logger.log("error",error)
            res.status(501).send("Internal server error!")
        }
    }
   
}
export const logout = async (req,res) => {
    try {
        const userId = req.params.id
        const user = await User.findById(userId)
        const userName = user.username
        logger.log("info","Logout req for user " + userName)
        res.status(200).send("Tested logout ")
        logger.log("info","Logout res for user " + userName)
    } catch (error) {
        logger.log("error",error)
        res.status(500).send("Internal Server Error");

    }

}
