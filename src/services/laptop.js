const db = require('../models')
const { Op, where } = require('sequelize')
const category = require('./category')
const image = require('./image')
const detailLaptop = require('./detailLaptop')
const categoryLaptop = require('./categoryLaptop')
const cloudinary =  require('cloudinary').v2
const con = require('../config/db')

// create laptop
export const createLaptop = (data) => new Promise(async(resolve, reject) => {
    try {
        const laptop = await db.Laptop.create(data)
        const id = laptop.dataValues.id
        resolve({
            laptop_id: id,
        })  

    } catch (error) {
        reject(error)
    }

})

// get one laptop
export const getLaptop = (id) => new Promise( async (resolve, reject) => {
    try {
    
        const  laptop = await db.Laptop.findOne({
            where: { id: id},
            include:[
                {
                    model: db.DetailLaptop,
                    foreignKey: 'detail_id', 
                    attributes: {
                        exclude: ['id', 'createdAt', 'updatedAt']
                    }
                },
                {
                    model: db.Brand,
                    foreignKey: 'brand_id', 
                    attributes: {
                        exclude: ['id', 'createdAt', 'updatedAt', 'status']
                    }
                },
            ],
            raw: true,
            nest: true
        })

        if(!laptop)  {
            return resolve({
                laptop: null
            })
        }

        // get category name
        const { categories_id } = await categoryLaptop.getListCategoryId(id)
        const list_id = categories_id.map(category => category.category_id)
        const { list_categories } = await category.getListCategory(list_id)
        const categories_name = list_categories.map(category => category.category_name)
        laptop.categories = categories_name

        // get image for laptop 
        const listImages = await image.getListImages(id)
        laptop.images = listImages.images
        resolve({ 
            laptop: laptop
        })
    } catch (error) {
        reject(error)
        
    }
})

export const getListLaptopById = (id) => new Promise(async (resolve, reject) => {

    const query = {}
    query.id = { [Op.in]: id }

    const laptops = await db.Laptop.findAndCountAll({
        where: query,
        include:[
            {
                model: db.DetailLaptop,
                foreignKey: 'detail_id', 
                attributes: {
                    exclude: ['', 'createdAt', 'updatedAt']
                }
            },
            {
                model: db.Brand,
                foreignKey: 'brand_id', 
                attributes: {
                    exclude: ['id', 'createdAt', 'updatedAt', 'status']
                }
            }
        ],
       raw: true, 
       nest: true
    })

    for (let i = 0; i < laptops.rows.length; i++) {
        // get category name
        const laptop_id = laptops.rows[i].id
        const { categories_id } = await categoryLaptop.getListCategoryId(laptop_id)
        const list_id = categories_id.map(category => category.category_id)
        const { list_categories } = await category.getListCategory(list_id)
        const categories_name = list_categories.map(category => category.category_name)
        laptops.rows[i].category = categories_name
        // get image 
        const listImages = await image.getListImages(laptop_id)
        laptops.rows[i].images = listImages.images
    }    
    return  resolve({
            laptops : laptops
    })
})


// get list laptop
export const getListLaptops = ({page, limit, name, price, ...query}) => new Promise( async(resolve, reject) => {
    try {  
        const queries = { raw: true, nest: true, }
        const flimit = (limit)  ? +limit : +process.env.LIMIT_BOOK 
        queries.limit = flimit
        const offset = (page) ? ((+page)-1)*flimit: 0 
        queries.offset = offset
        
        if(name != undefined) query.laptop_name = {[Op.substring] : name}
        if(price != undefined) query.price = {[Op.between]: price}

        const laptops = await db.Laptop.findAndCountAll({
            where: query,
            attributes: {
                exclude: ['brand_id']
            },
            include:[
                {
                    model: db.DetailLaptop,
                    foreignKey: 'detail_id', 
                    attributes: {
                        exclude: ['', 'createdAt', 'updatedAt']
                    }
                },
                {
                    model: db.Brand,
                    foreignKey: 'brand_id', 
                    attributes: {
                        exclude: ['id', 'createdAt', 'updatedAt', 'status']
                    }
                }
            ],
            ...queries
        })
        
   
        for (let i = 0; i < laptops.rows.length; i++) {
            // get category name
            const laptop_id = laptops.rows[i].id
            const { categories_id } = await categoryLaptop.getListCategoryId(laptop_id)
            const list_id = categories_id.map(category => category.category_id)
            const { list_categories } = await category.getListCategory(list_id)
            const categories_name = list_categories.map(category => category.category_name)
            laptops.rows[i].category = categories_name
            // get image 
            const listImages = await image.getListImages(laptop_id)
            laptops.rows[i].images = listImages.images
        }    
        return  resolve({
                laptops : laptops
        })
    } catch (error) {
        reject(error)
    }
})

export const getAllLaptops =  () => new Promise(async  (resolve, reject) => {
    try {  
        const laptops = await db.Laptop.findAndCountAll({
            include:[
                {
                    model: db.DetailLaptop,
                    foreignKey: 'detail_id', 
                    attributes: {
                        exclude: ['', 'createdAt', 'updatedAt']
                    }
                },
                {
                    model: db.Brand,
                    foreignKey: 'brand_id', 
                    attributes: {
                        exclude: ['id', 'createdAt', 'updatedAt', 'status']
                    }
                }
            ],
           raw: true, 
           nest: true
        })
   
        for (let i = 0; i < laptops.rows.length; i++) {
            // get category name
            const laptop_id = laptops.rows[i].id
            const { categories_id } = await categoryLaptop.getListCategoryId(laptop_id)
            const list_id = categories_id.map(category => category.category_id)
            const { list_categories } = await category.getListCategory(list_id)
            const categories_name = list_categories.map(category => category.category_name)
            laptops.rows[i].category = categories_name
            // get image 
            const listImages = await image.getListImages(laptop_id)
            laptops.rows[i].images = listImages.images
        }    
        return  resolve({
                laptops : laptops
        })
    } catch (error) {
        reject(error)
    }

})

export const getCategoryLaptops = (id) => new Promise( async(resolve, reject) => {
    try {
        const sql = `SELECT laptops.id FROM categories INNER JOIN categorylaptops on categories.id = categorylaptops.category_id
                    INNER JOIN laptops on categorylaptops.laptop_id = laptops.id
                    WHERE categories.id = ${id}`

        con.query(sql, async (err, rows) => {
            const new_rows = rows.map(row => row.id)
           
            const laptops = await db.Laptop.findAndCountAll({
                where: {
                    id: new_rows
                },
                attributes: {
                    exclude: ['brand_id']
                },
                include:[
                    {
                        model: db.DetailLaptop,
                        foreignKey: 'detail_id', 
                        attributes: {
                            exclude: ['', 'createdAt', 'updatedAt']
                        }
                    },
                    {
                        model: db.Brand,
                        foreignKey: 'brand_id', 
                        attributes: {
                            exclude: ['id', 'createdAt', 'updatedAt', 'status']
                        }
                    }
                ],
                raw: true,
                nest: true 
            })
            for (let i = 0; i < laptops.rows.length; i++) {
                // get category name
                const laptop_id = laptops.rows[i].id
                const { categories_id } = await categoryLaptop.getListCategoryId(laptop_id)
                const list_id = categories_id.map(category => category.category_id)
                const { list_categories } = await category.getListCategory(list_id)
                const categories_name = list_categories.map(category => category.category_name)
                laptops.rows[i].category = categories_name
                // get image 
                const listImages = await image.getListImages(laptop_id)
                laptops.rows[i].images = listImages.images
            }
            resolve({ 
                laptops: laptops 
            })
        })
        
    } catch (error) {
        reject(error)
    }
})

export const getBrandLaptops = (id) => new Promise( async(resolve, reject) => {
    try {

        const sql = `SELECT laptops.id FROM brands INNER JOIN laptops ON laptops.brand_id = brands.id WHERE brands.id = ${id}`
        con.query(sql, async (err, result) => {
            const id = result.map(item => item.id)
            const laptops = await db.Laptop.findAndCountAll({
                where: {
                    id: id
                },
                attributes: {
                    exclude: ['brand_id']
                },
                include:[
                    {
                        model: db.DetailLaptop,
                        foreignKey: 'detail_id', 
                        attributes: {
                            exclude: ['', 'createdAt', 'updatedAt']
                        }
                    },
                    {
                        model: db.Brand,
                        foreignKey: 'brand_id', 
                        attributes: {
                            exclude: ['id', 'createdAt', 'updatedAt', 'status']
                        }
                    }
                ],
                raw: true,
                nest: true 
            })
            for (let i = 0; i < laptops.rows.length; i++) {
                // get category name
                const laptop_id = laptops.rows[i].id
                const { categories_id } = await categoryLaptop.getListCategoryId(laptop_id)
                const list_id = categories_id.map(category => category.category_id)
                const { list_categories } = await category.getListCategory(list_id)
                const categories_name = list_categories.map(category => category.category_name)
                laptops.rows[i].category = categories_name
                // get image 
                const listImages = await image.getListImages(laptop_id)
                laptops.rows[i].images = listImages.images
            }
            resolve({ 
                laptops: laptops 
            })
        })

    } catch (error) {
        reject(error)
    }
})

// update 
export const updateLaptop = (data, laptop_id) => new Promise( async (resolve, reject) => {
    try {
        // update table laptop
       // console.log(data.laptop, laptop_id)
        const laptop = await db.Laptop.update(data.laptop, {where: {id : +laptop_id}})

        // update detail laptop
        const detail = await getLaptop(laptop_id)
        const detail_id = detail.laptop.detail_id
        const detail_laptop = await db.DetailLaptop.update(data.detail_laptop, {where: {id : detail_id}})
        console.log(detail_laptop)
        
        // update category laptop
            // delete 
        await db.CategoryLaptop.destroy({
            where: { laptop_id: laptop_id },
            force: true
        })

            // create 
        const category_id = data.category
        const categoryLaptopData = category_id.map(category => {
            return {
                category_id: category,
                laptop_id: laptop_id
            }
        })
        await categoryLaptop.createMulCategoryLaptop(categoryLaptopData)
        const images = data.images

        if(images.length > 0 ){
        
            // delete images old 
            const listImg = await image.getListImages(laptop_id) 
            listImg.images.forEach(item => {
                cloudinary.uploader.destroy(item.image_name)
            })            
            await image.remove(laptop_id)

            // create new images 
            const data_img = images.map(item => {
                return {
                    laptop_id: laptop_id,
                    path: item.path,
                    image_name: item.filename
                }
            })
            await image.createMulImage(data_img)
        }

        const newLaptop = await getLaptop(laptop_id)
        resolve({
            laptop: newLaptop
        })
        
    } catch (error) {
        reject(error)
    }
})

// delete 
export const deleteLaptop = (laptop_id) => new Promise( async (resolve, reject) => {
    try {
        const laptop  = await getLaptop(laptop_id) 
        const detail_id = laptop.laptop.detail_id
      
        // await categoryLaptop.remove(laptop_id)

        await detailLaptop.deleteDetailLaptop(detail_id)
       
        // delete image on cloudinary 
        const listImages =  await  image.getListImages(laptop_id)
        const img = listImages.images
        console.log(img)
        img.forEach(image => {     
            cloudinary.uploader.destroy(image.image_name)
        })

        await image.remove(laptop_id)
        await db.Laptop.destroy({
            where: { id: laptop_id },
            force: true,
        })
      
        resolve({
            status: 1 
        })

    } catch (error) {
        reject(error)
        
    }
})