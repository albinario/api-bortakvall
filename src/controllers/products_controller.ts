import Debug from 'debug'
import { Request, Response } from 'express'
import { validationResult } from 'express-validator'
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
			message: "Not found"
		})
	}
}

export const store = async (req: Request, res: Response) => {
	const validationErrors = validationResult(req)
	if (!validationErrors.isEmpty()) {
		return res.status(400).json({ status: "fail", data: validationErrors.array() })
	}

	try {
		const product = await prisma.product.create({
			data: {
				name: req.body.name,
				description: req.body.description,
				price: req.body.price,
				on_sale: req.body.on_sale,
				images: req.body.images,
				stock_status: req.body.stock_status,
				stock_quantity: req.body.stock_quantity
			}
		})
		res.send({
			status: "success",
			data: product
		})
	} catch (err) {
		return res.status(500).send({ status: "error", message: "Something went wrong" })
	}
}