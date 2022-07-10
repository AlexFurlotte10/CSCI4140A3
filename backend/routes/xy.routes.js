// import express
import express from "express";

// import function from controller
import {
  showProducts,
  createXPo,
  createYPo,
  createLine,
} from "../controllers/xyProduct.js";

// init express router
const xyrouter = express.Router();

// Get All Parts
xyrouter.get("/products", showProducts);

// Submit POs
xyrouter.post("/xproducts", createXPo);
xyrouter.post("/yproducts", createYPo);

// Submit Line
xyrouter.post("/line", createLine);

export default xyrouter;
