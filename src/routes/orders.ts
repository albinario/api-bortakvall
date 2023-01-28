import { Order } from '@prisma/client'
import { rejects } from 'assert'
import express from 'express'
import { body } from 'express-validator'
import internal from 'stream'
import { index, show, store } from '../controllers/orders_controller'
const router = express.Router()

router.get('/', index)

router.get('/:orderId', show)

router.post('/', [
	body('customer_first_name')
		.exists().withMessage("First name is missing").bail()
		.isString().withMessage("First name has to be a string")
		.isLength({ min: 2, max: 191 }).withMessage("First name has to be between 2 and 191 characters"),
	body('customer_last_name')
		.exists().withMessage("Last name is missing").bail()
		.isString().withMessage("Last name has to be a string")
		.isLength({ min: 2, max: 191 }).withMessage("Last name has to be between 2 and 191 characters"),
	body('customer_address')
		.exists().withMessage("Address is missing").bail()
		.isString().withMessage("Address has to be a string")
		.isLength({ min: 2, max: 191 }).withMessage("Address has to be between 2 and 191 characters"),
	body('customer_postcode')
		.exists().withMessage("Post code is missing").bail()
		.isString().withMessage("Post code has to be a string")
		.isLength({ max: 6 }).withMessage("Post code can't be more than 6 characters"),
	body('customer_city')
		.exists().withMessage("City is missing").bail()
		.isString().withMessage("City has to be a string")
		.isLength({ min: 2, max: 191 }).withMessage("City has to be between 2 and 191 characters"),
	body('customer_email')
		.exists().withMessage("Email is missing").bail()
		.isEmail().withMessage("Email is in wrong format"),
	body('customer_phone')
		.optional()
		.isInt().withMessage("Phone must be a number"),
	body('order_total')
		.exists().withMessage("Order total is missing").bail()
		.isInt().withMessage("Order total must be a number"),
	body('order_items.*.product_id')
		.exists().withMessage("Product ID is missing").bail()
		.isInt({ min: 1 }).withMessage("Product ID has to be a number")
], store)

export default router