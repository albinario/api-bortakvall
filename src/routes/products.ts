import express from 'express'
import { body } from 'express-validator'
import { index, show, store } from '../controllers/products_controller'
const router = express.Router()

router.get('/', index)

router.get('/:productId', show)

router.post('/', [], store)

export default router