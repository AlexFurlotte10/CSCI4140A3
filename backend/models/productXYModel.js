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

      yProducts = yProducts.map(
        ({
          Y_No204: P_No204,
          Y_Name204: P_Name204,
          Y_CurrentPrice204: P_CurrentPrice204,
          Y_QOH204: P_QOH204,
        }) => ({
          P_No204,
          P_Name204,
          P_CurrentPrice204,
          P_QOH204,
        })
      );

      xProducts = xProducts.map(
        ({
          X_No204: P_No204,
          X_Name204: P_Name204,
          X_CurrentPrice204: P_CurrentPrice204,
          X_QOH204: P_QOH204,
        }) => ({
          P_No204,
          P_Name204,
          P_CurrentPrice204,
          P_QOH204,
        })
      );

      for (const x of xProducts) {
        for (const y of yProducts) {
          // if no is same we add the lower price
          if (x.P_No204 == y.P_No204) {
            if (x.P_CurrentPrice204 < y.P_CurrentPrice204) {
              final.push(x);
              break;
            } else if (x.P_CurrentPrice204 > y.P_CurrentPrice204) {
              final.push(y);
              break;
            }
            // if price is the same, we add the higher quantity
            else {
              if (x.P_QOH204 > y.P_QOH204) {
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

export const insertPo = (data, result) => {
  db.query("INSERT INTO z_POs204 SET ?", [data], (err, results) => {
    if (err) {
      console.log(err);
      result(err, null);
    } else {
      result(null, results);
    }
  });
};
