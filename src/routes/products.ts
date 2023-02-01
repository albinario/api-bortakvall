import express from 'express'
import { index, show, store } from '../controllers/products_controller'
import { productValidation } from '../validations/product_validation'
const router = express.Router()

router.get('/', index)

router.get('/:productId', show)

router.post('/', productValidation, store)

export default router