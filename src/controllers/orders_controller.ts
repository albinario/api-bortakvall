import Debug from 'debug'
import { Request, Response } from 'express'
import { matchedData, validationResult } from 'express-validator'
import prisma from '../prisma'

const debug = Debug('prisma-api:orders_controller')

export const index = async (req: Request, res: Response) => {
	try {
		const orders = await prisma.order.findMany()
		res.send({
			status: 'success',
			data: orders
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
		const order = await prisma.order.findUniqueOrThrow({
			where: {
				id: Number(req.params.orderId)
			},
			include: {
				orderItems: true
			}
		})
		res.send({
			status: 'success',
			data: order
		})
	} catch (err) {
		return res.status(404).send({
			status: 'fail',
			message: "Order not found"
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
		const order = await prisma.order.create({
			data: {
				customer_first_name: validData.customer_first_name,
				customer_last_name: validData.customer_last_name,
				customer_address: validData.customer_address,
				customer_postcode: validData.customer_postcode,
				customer_city: validData.customer_city,
				customer_email: validData.customer_email,
				customer_phone: validData.customer_phone,
				order_total: validData.order_total,
				orderItems: {
					create: validData.order_items
				}
			},
			include: {
				orderItems: true
			}
		})
		res.send({
			status: 'success',
			data: order
		})
	} catch (err) {
		return res.status(500).send({
			status: 'error',
			message: "Something went wrong"
		})
	}
}