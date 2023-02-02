import internal from "stream"

export type ProductData = {
	name: string,
	description: string,
	price: number,
	images?: {
		thumbnail: string,
		large: string
	},
	stock_status: string,
	stock_quantity: number,
	on_sale?: boolean
}