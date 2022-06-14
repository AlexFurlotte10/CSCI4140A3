// import connection
import db from "../config/database.js";
  
// Get All Products
export const getProducts = (result) => {
    db.query("SELECT * FROM parts204", (err, results) => {             
        if(err) {
            console.log(err);
            result(err, null);
        } else {
            result(null, results);
        }
    });   
}
//insert purchase order
export const insertPo = (data, result) => {
    db.query("INSERT INTO pos204 SET ?", [data], (err, results) => {             
        if(err) {
            console.log(err);
            result(err, null);
        } else {
            result(null, results);
        }
    });   
}
  