import Debug from 'debug'
import { Request, Response } from 'express'
import { matchedData, validationResult } from 'express-validator'
import prisma from '../prisma'

const debug = Debug('prisma-api:products_controller')

export const index = async (req: Request, res: Response) => {
	try {
		const products = await prisma.product.findMany()
		res.send({
			status: "success",
			data: products
		})
	} catch (err) {
		res.status(500).send({
			status: "error",
			message: "Something went wrong"
		})
	}
}

export const show = async (req: Request, res: Response) => {
	try {
		const product = await prisma.product.findUniqueOrThrow({
			where: {
				id: Number(req.params.productId)
			}
		})
		res.send({
			status: "success",
			data: product
		})
	} catch (err) {
		return res.status(404).send({
			status: "fail",
			message: "Product not found"
		})
	}
}

export const store = async (req: Request, res: Response) => {
	const validationErrors = validationResult(req)
	if (!validationErrors.isEmpty()) {
		return res.status(400).send({
			status: "fail",
			data: validationErrors.array()
		})
	}
	const validData = matchedData(req)

	try {
		const product = await prisma.product.create({
			data: {
				name: validData.name,
				description: validData.description,
				price: validData.price,
				on_sale: validData.on_sale,
				images: validData.images,
				stock_status: validData.stock_status,
				stock_quantity: validData.stock_quantity
			}
		})
		res.send({
			status: "success",
			data: product
		})
	} catch (err) {
		return res.status(500).send({
			status: "error",
			message: "Something went wrong"
		})
	}
}