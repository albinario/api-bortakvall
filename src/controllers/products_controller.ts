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
			status: "fail",
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
			status: "error",
			message: "Not found"
		})
	}
}

export const store = async (req: Request, res: Response) => {
}