
import { getProducts, insertPo} from "../models/productModel.js";

//list all parts
export const showProducts = (req, res) => {
    getProducts((err, results) => {
        if (err){
            res.send(err);
        }else{
            res.json(results);
        }
    });
}

//insert purchase order and check poNo is unique
export const createPo = (req, res) => {
    const data = req.body;
    insertPo(data, (err, results) => {
        if (err){
            res.send(err);
        }else{
            res.json(results);
        }
    });
}
/*export const insertPO204 = (req, res) => {
  sql = "INSERT INTO pos204(POs_PoNo204, POs_ClientCompID, POs_DateofPO, POs_Status) VALUES ('1284', '1284', 'January-25-2000', 'Good') ";
  db.query(sql, function insertPurchaseOrder(err) {
    if (err) throw err;
    console.log("1 record inserted");
  });
}
  //insert line
  export const insertLine204 = (req, res) => {
  sql = "INSERT INTO line204(L_PoNo204, L_LineNo204, L_PartNo204, L_QTY204, L_PriceOrdered204) VALUES ('1834', '1284', '1234', '4', '10.99') ";
  db.query(sql, function insertLine(err) {
    if (err) throw err;
    console.log("1 record inserted");
  });
}
  //check if quantity and price pass rules

  //check client id

  //list POs given client id
  export const listPO204 = (req, res) => {
  sql = "SELECT * FROM `pos204`";
  db.query(sql, function listParts (err, result) {
    if (err) throw err;
    console.log(result);
  });
  }
  //list lines given PO number
  export const listLine204 = (req, res) => {
  sql = "SELECT * FROM `lines204`";
  db.query(sql, function listParts (err, result) {
    if (err) throw err;
    console.log(result);
  });
};

*/