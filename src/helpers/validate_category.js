const joi = require('joi')
const db = require('../models')
const handleError = require('../middlewares/handle_errors')


const isCategoryExit = async (category_name, res) =>  {
    try {
        const category = await db.Category.findOne({ where : { category_name } })
        if(category === null ) {
            return false
        } else return true
    } catch (error) {
        handleError.badRequest(error, res)
    }
}
const validateCategory = async (req, res, next) => {
    const { error } = schema.validate(req.body)
    if(error){
        res.status(400).json({ 
            error: error.message,
            status : 0 
        })
    } else {
        const checkExit = await isCategoryExit(req.body.category_name, res)
        console.log('check exit', checkExit)
        if(!checkExit) next()
        else return res.status(401).json({
            error: `${req.body.category_name} is exit`, 
            status: 0
        })
    } 
}

const schema = joi.object({
    category_name: joi.string().required(),
    status: joi.number().integer().required()
})

module.exports = validateCategory