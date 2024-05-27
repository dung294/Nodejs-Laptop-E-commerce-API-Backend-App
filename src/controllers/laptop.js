const laptopService = require('../services/laptop')
const detailLaptopService = require('../services/detailLaptop')
const categoryLaptopService = require('../services/categoryLaptop')
const imageService = require('../services/image')
const handleError = require('../middlewares/handle_errors')


const create = async (req, res) => {
    try {
        const images = req.files

        // insert data into table detail laptop
        const { detail_id } = await detailLaptopService.crateDetailLaptop(req.body.detail_laptop)

        //insert data into table laptop
        let laptop_data = req.body.laptop
        laptop_data.detail_id = detail_id
        const { laptop_id } = await laptopService.createLaptop(laptop_data)

        //insert data into table category laptop
        const category_id = req.body.category
        const categoryLaptopData = category_id.map(category => {
            return {
                category_id: category,
                laptop_id: laptop_id
            }
        })
        await categoryLaptopService.createMulCategoryLaptop(categoryLaptopData)

        // insert image into images
        const imageData = images.map(image => {
            return {
                laptop_id: laptop_id,
                image_name: image.filename,
                path: image.path 
            }
        })
        await imageService.createMulImage(imageData)

        const { laptop } = await laptopService.getLaptop(laptop_id)
    

        res.status(200).json({
            message: 'Laptop created  successfully',
            laptop: laptop,
            status: 1
        })

    } catch (error) {
        handleError.internalServerError(res, error)
    }
}

// update laptop 
const updateLaptop = async (req, res) => {
    try {

        const laptop_id = req.params.id
        const images = req.files
        const data = {
            laptop: req.body.laptop,
            detail_laptop: req.body.detail_laptop,
            category: req.body.category,
            images: images
        }   

        const { laptop  } = await laptopService.updateLaptop(data, laptop_id)
        return res.status(200).json({
            status: 1,
            message: "Update oke",
            laptop: laptop
        })

        
    } catch (error) {
        handleError.internalServerError(res, error)
        
    }
}

const getOne = async (req, res) => {
    try {
        const id = +req.params.id
        
        const { laptop } = await laptopService.getLaptop(id)
       
        
        res.status(200).json({
            message: !laptop ? 'Not found': 'Laptop get  successfully',
            laptop: laptop,
            status: !laptop ? 0: 1
        })

    } catch (error) {
        handleError.internalServerError(res, error) 
    }
}

// delete laptop
const deleteLaptop = async (req, res) => {
    try {
        const id = +req.params.id
        await  laptopService.deleteLaptop(id)
        
        return res.status(200).json({
            status: 1,
            message: 'delete ok'
        })
    } catch (error) {
        handleError.internalServerError(res, error)
    }

}

// get list laptop
const getListLaptops = async (req, res) => {
    try {
        
        const { laptops } = await laptopService.getAllLaptops()
    
        return res.status(200).json({ 
            message: laptops.count == 0 ?'not found' : 'got list laptop',
            data: laptops.count == 0? null : laptops,
            status: laptops.count == 0? 0 : 1,
        })
    } catch (error) {
        
        handleError.internalServerError(res, error)
    }
}

const getCategoryLaptops = async (req, res) => {
    try {
        const id = req.params.id 
        const { laptops } = await laptopService.getCategoryLaptops(+id)
        return res.status(200).json({ 
            message: laptops.count == 0 ?'not found' : 'got list laptop',
            data: laptops.count == 0? null : laptops,
            status: laptops.count == 0? 0 : 1,
        })
        
    } catch (error) {
        handleError.internalServerError(res, error)
        
    }
}
const getBrandLaptops = async (req, res) => {
    try {
        const id = req.params.id 
        const { laptops } = await laptopService.getBrandLaptops(+id)
        return res.status(200).json({ 
            message: laptops.count == 0 ?'not found' : 'got list laptop',
            data: laptops.count == 0? null : laptops,
            status: laptops.count == 0? 0 : 1,
        })
        
    } catch (error) {
        handleError.internalServerError(res, error)
        
    }
}

const getCommendLaptops = async (req, res) => {
    try {
        const id = req.params.id 
        const { laptop } = await laptopService.getLaptop(+id)
        const brand_id = laptop.brand_id
        const categories = laptop.categories 
        const price = laptop.price
        const { laptops } = await  laptopService.getAllLaptops()
        const listLaptops = laptops.rows  
        
        const data = listLaptops.filter(item => {
           var check = false 
            for(let i=0 ; i<categories.length ; i++) {
                for(let j=0 ; j<item.categories; j++) {
                    if(categories[i] == item.categories[j]) check = true
                 }
                 if(check) break
            }
           var checkPrice = false ; 
           if (item.price >= price + 30000000 || item.price <= price - 30000000) checkPrice = true  
           if( brand_id == item.brand_id || check || checkPrice) return true
           else return false
        })

        const resPonse = {
            count: data.length, 
            rows: data
           
        }

        return res.status(200).json({ 
            message: data.count == 0 ?'not found' : 'got list laptop commend',
            data: data.count == 0? null : resPonse,
            status: data.count == 0? 0 : 1,
        })
    } catch (error) {
        handleError.internalServerError(res, error)
        
    }
}

const getSearchLaptops = async (req, res) => {
    try {
        console.log("true")
        const { laptops } = await laptopService.getAllLaptops() 
        console.log(laptops.rows)
        
        const keySearch = req.query.keySearch

        const data = laptops.rows.filter(item => {
            if (item.laptop_name.toLowerCase().includes(keySearch.toLowerCase())) return true 
            if(item.price == +keySearch) return true 
            if(item.Brand.brand_name.includes(keySearch)) return true 
            for(let i=0; i<item.category.length; i++) {
                if(item.category[i].includes(keySearch)) return true
            }
            return false 
        })
        return res.status(200).json({
            message: data.length == 0 ?'not found' : 'got list laptop commend',
            data: data.length == 0? null : data,
            status: data.length == 0? 0 : 1,
        })

 
    } catch (error) {
        handleError.internalServerError(res, error)
        
    }
}


module.exports = {
    create,
    updateLaptop,
    deleteLaptop,
    getOne,
    getListLaptops,
    getCategoryLaptops,
    getBrandLaptops, 
    getCommendLaptops,
    getSearchLaptops

}