import Debug from 'debug'
import { Request, Response } from 'express'
import { getProducts, getProduct, createProduct } from '../services/products_service'
import { matchedData, validationResult } from 'express-validator'

const debug = Debug('prisma-api:products_controller')

export const index = async (req: Request, res: Response) => {
	try {
		const products = await getProducts()
		res.send({
			status: 'success',
			data: products
		})
	} catch (err) {
		res.status(500).send({
			status: 'error',
			message: "Something went wrong"
		})
	}
}

export const show = async (req: Request, res: Response) => {
	try {
		const product = await getProduct(Number(req.params.productId))
		res.send({
			status: 'success',
			data: product
		})
	} catch (err) {
		return res.status(404).send({
			status: 'fail',
			message: "Product not found"
		})
	}
}

export const store = async (req: Request, res: Response) => {
	const validationErrors = validationResult(req)
	if (!validationErrors.isEmpty()) {
		return res.status(400).send({
			status: 'fail',
			data: validationErrors.array()
		})
	}
	const validData = matchedData(req)

	try {
		const product = await createProduct({
			name: validData.name,
			description: validData.description,
			price: validData.price,
			images: validData.images,
			stock_status: validData.stock_status,
			stock_quantity: validData.stock_quantity,
			on_sale: validData.on_sale
		})
		res.send({
			status: 'success',
			data: product
		})
	} catch (err) {
		return res.status(500).send({
			status: 'error',
			message: "Something went wrong"
		})
	}
}