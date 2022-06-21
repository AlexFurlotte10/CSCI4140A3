// import express
import express from "express";
  
// import function from controller
import { createLine, createPo, listPo, retrieveMyLine, showProducts, retrievePo } from "../controllers/Product.js";
  
// init express router
const router = express.Router();
  
// Get All Parts
router.get('/products', showProducts);

//insert product
router.post('/products', createPo);
  
//insert Line
router.post('/productsline', createLine);

// Get All Purchase orders
router.get('/productsorders', listPo);

// Get All specific purchase order
router.get('/productsLines', retrieveMyLine);

// Get All specific purchase order
router.get('/productsOrder', retrievePo);


export default router;