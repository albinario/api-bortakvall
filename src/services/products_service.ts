import prisma from '../prisma'
import { ProductData } from '../types'

export const getProducts = async () => await prisma.product.findMany()

export const getProduct = async (id: number) => {
	return await prisma.product.findUniqueOrThrow({
		where: {
			id: id
		}
	})
}

export const createProduct = async (data: ProductData) => {
	return await prisma.product.create({
		data: data
	})
}