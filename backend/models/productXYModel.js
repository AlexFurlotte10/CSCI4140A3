import e from "express";
import db from "../config/database.js";

// Get All Products
export const getProducts = (result) => {
  let xProducts,
    yProducts,
    final = [];
  db.query("SELECT * FROM `x_Parts204`", (err, results) => {
    if (err) {
      console.log(err);
      result(err, null);
    } else {
      // result(null, results);
      xProducts = results;
    }
  });

  db.query("SELECT * FROM `y_Parts204`", (err, results) => {
    if (err) {
      console.log(err);
      result(err, null);
    } else {
      yProducts = results;

      for (const x of xProducts) {
        for (const y of yProducts) {
          // if no is same we add the lower price
          if (x.X_No204 == y.Y_No204) {
            if (x.X_CurrentPrice204 < y.Y_CurrentPrice204) {
              final.push(x);
              break;
            } else if (x.X_CurrentPrice204 > y.Y_CurrentPrice204) {
              final.push(y);
              break;
            }
            // if price is the same, we add the higher quantity
            else {
              if (x.X_QOH204 > y.Y_QOH204) {
                final.push(x);
                break;
              } else {
                final.push(y);
                break;
              }
            }
          }
        }
      }

      result(null, final);
    }
  });
};
