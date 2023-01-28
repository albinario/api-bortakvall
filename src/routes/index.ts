import express from "express"
import products from './products'

const router = express.Router()

router.get('/', (req, res) => {
	res.send({
		message: "I AM API, BEEP BOOP"
	})
})

router.use('/products', products)

export default router