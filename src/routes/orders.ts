import express from 'express'
import { index, show, store } from '../controllers/orders_controller'
import { orderValidation } from '../validations/order_validation'
const router = express.Router()

router.get('/', index)

router.get('/:orderId', show)

router.post('/', orderValidation, store)

export default router