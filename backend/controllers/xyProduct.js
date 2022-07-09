import {
  getProducts,
  insertXPo,
  insertYPo,
  insertLine,
} from "../models/productXYModel.js";

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

//insert purchase order and check poNo is unique
export const createXPo = (req, res) => {
  const data = req.body;
  insertXPo(data, (err, results) => {
    if (err) {
      res.send(err);
    } else {
      res.json(results);
    }
  });
};

//insert purchase order and check poNo is unique
export const createYPo = (req, res) => {
  const data = req.body;
  insertYPo(data, (err, results) => {
    if (err) {
      res.send(err);
    } else {
      res.json(results);
    }
  });
};

//insert line order and check poNo is unique
export const createLine = (req, res) => {
  const data = req.body;
  console.log(data);
  insertLine(data, (err, results) => {
    if (err) {
      res.send(err);
    } else {
      res.json(results);
    }
  });
};
