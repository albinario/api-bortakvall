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
		debug("Error thrown when fetching all products", err)
		res.status(500).send({ message: "Something went wrong" })
	}
}

export const show = async (req: Request, res: Response) => {
}

export const store = async (req: Request, res: Response) => {
}