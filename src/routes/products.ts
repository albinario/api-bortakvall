import express from 'express'
import { body } from 'express-validator'
import { index, show, store } from '../controllers/products_controller'
const router = express.Router()

router.get('/', index)

router.get('/:productId', show)

router.post('/', [
	body('name')
		.exists().withMessage('Name is missing').bail()
		.isString().withMessage('Has to be a string')
		.isLength({ min: 2, max: 191 }).withMessage('String has to be between 2 and 191 characters'),
	body('description')
		.exists().withMessage('Description is missing').bail()
		.isString().withMessage('Has to be a string'),
	body('price')
		.exists().withMessage('Price is missing').bail()
		.isInt({ min: 1 }).withMessage('Has to be an integer with a value'),
	body('images')
		.optional()
		.isObject().withMessage('Has to be an object'),
	body('stock_status')
		.exists().withMessage('Stock status is missing').bail()
		.isString().withMessage('Has to be a string'),
	body('stock_quantity')
		.exists().withMessage('Stock quantity is missing').bail()
		.isInt({ min: 0 }).withMessage('Has to be a positive integer'),
	body('on_sale')
		.optional()
		.isBoolean().withMessage('Has to be a boolean')
], store)

export default router