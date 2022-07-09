// import express
import express from "express";

// import function from controller
import { showProducts } from "../controllers/xyProduct.js";

// init express router
const xyrouter = express.Router();

// Get All Parts
xyrouter.get("/products", showProducts);

export default xyrouter;
