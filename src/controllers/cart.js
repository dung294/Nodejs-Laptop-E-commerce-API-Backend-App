const cartService = require('../services/cart')
const handleError = require('../middlewares/handle_errors')


const insertCart = async (req, res) => {
    try {
        // check is exit 

        const user_id = req.user.user.id 
        const { laptop_id } = req.body
        const { qty } = req.body
        const isExit = await  cartService.checkIsExit(user_id, laptop_id)
        if(isExit.isExit) {
            return res.status(201).json({
                status: 0,
                message: 'Laptop is exit in cart',
                data: null 
            })
        }

        const rs = await cartService.add(user_id,laptop_id,qty)  
        
      
        return res.status(200).json(rs)      
    } catch (error) {
        handleError.internalServerError(res, error)  
    }  
}

const getAll = async (req, res) => {
    try {
        const user_id = req.user.user.id
        const listCarts = await cartService.getAll(user_id)

        const data = listCarts.laptops
        if(listCarts.length === 0) {
            return res.status(200).json({
                message: "Cart is empty",
                status: 1,
                data: {
                    count: 0,
                    rows: []
                }
            })
        }
        return res.status(200).json({
            message: "Get all cart items",
            status: 1,
            data: listCarts.laptops
        })
    } catch (error) {
        handleError.internalServerError(res, error)
    }
}

const updateItem = async (req, res) => {

    try {
     
        const user_id = req.user.user.id 
        const  laptop_id = req.params.laptop_id
        const { qty } = req.body
        await cartService.updateItem(user_id,+laptop_id,qty)
        return res.status(200).json({
            status: 1,
            message: "Update oke",
            data: null 
        })

        
    } catch (error) {
        handleError.internalServerError(res, error)
    }
}

const removeItem =  async (req, res) => {
    try {
        
        const user_id = req.user.user.id 
        const laptop_id  = req.params.laptop_id
        await cartService.removeItem(user_id,laptop_id)
        return res.status(200).json({
            status: 1,
            message: "Delete successfully",
            data: null
        })
    } catch (error) {
        
    }
}

module.exports = {
    insertCart,
    getAll,
    updateItem,
    removeItem
}