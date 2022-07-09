import db from "../config/database.js";

// Get All Products
export const getProducts = (result) => {
  let xProducts, yProducts;
  db.query("SELECT * FROM `x_Parts204`", (err, results) => {
    if (err) {
      console.log(err);
      result(err, null);
    } else {
      // result(null, results);
      xProducts = results;
      console.log(xProducts);
    }
  });

  db.query("SELECT * FROM `y_Parts204`", (err, results) => {
    if (err) {
      console.log(err);
      result(err, null);
    } else {
      yProducts = results;
      result(null, yProducts);
      console.log(yProducts);
    }
  });
};
