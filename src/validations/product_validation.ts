import { body } from 'express-validator'

export const productValidation = [
	body('name')
		.exists().withMessage("Name is missing").bail()
		.isString().withMessage("Name has to be a string")
		.isLength({ min: 2, max: 191 }).withMessage("Name has to be between 2 and 191 characters"),
	body('description')
		.exists().withMessage("Description is missing").bail()
		.isString().withMessage("Description has to be a string"),
	body('price')
		.exists().withMessage("Price is missing").bail()
		.isInt({ min: 1 }).withMessage("Price has to be an integer with a value"),
	body('images')
		.optional()
		.isObject().withMessage("Images has to be an object"),
	body('stock_status')
		.exists().withMessage("Stock status is missing").bail()
		.isString().withMessage("Stock status has to be a string"),
	body('stock_quantity')
		.exists().withMessage("Stock quantity is missing").bail()
		.isInt({ min: 0 }).withMessage("Stock quantity has to be an integer"),
	body('on_sale')
		.optional()
		.isBoolean().withMessage("On sale has to be a boolean")
]