import { getProducts } from "../models/productXYModel.js";

//list all parts
export const showProducts = (req, res) => {
  getProducts((err, results) => {
    if (err) {
      res.send(err);
    } else {
      res.json(results);
    }
  });
};
