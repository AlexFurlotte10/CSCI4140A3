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

      // formatting
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

      // check for which offers lower price
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

export const insertXPo = (data) => {
  db.query("INSERT INTO x_POs204 SET ?", [data], (err, results) => {
    if (err) {
      console.log(err);
    } else {
      console.log(results);
    }

    return;
  });
};

export const insertYPo = (data) => {
  db.query("INSERT INTO y_POs204 SET ?", [data], (err, results) => {
    if (err) {
      console.log(err);
    } else {
      console.log(results);
    }

    return;
  });
};

export const insertLine = (data, results) => {
  db.query(
    `SELECT * FROM x_Parts204 WHERE X_CurrentPrice204 = ${data.Z_PriceOrdered204} AND X_No204 = ${data.Z_PartNo204}`,
    (err, res) => {
      if (err) {
        console.log(data);
        console.log(err);
        return;
      } else {
        if (res && res.length) {
          data.Z_From204 = "X";
        } else {
          data.Z_From204 = "Y";
        }
        db.query("INSERT INTO z_Line204 SET ?", [data], (err, res) => {
          if (err) {
            console.log(err);
          } else {
            console.log(res);
            return;
          }
        });
      }
    }
  );
};
