// import express
import express from "express";
  
// import function from controller
import { createPo, showProducts } from "../controllers/Product.js";
  
// init express router
const router = express.Router();
  
// Get All Product
router.get('/products', showProducts);

//insert product
router.post('/products', createPo);
  /*
// Get Single Product
router.get('/product/:id', insertPO204);
  
// Create New Product
router.post('/product', insertLine204);
  
// Update Product
router.put('/product/:id', listLine204);
  
// Delete Product
router.delete('/product/:id', listPO204);
  */
// export default router
export default router;