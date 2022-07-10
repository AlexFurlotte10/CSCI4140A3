
import { getProducts, insertLine, insertPo, listPos, getTheLines, getThePos} from "../models/productModel.js";

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
//insert line order and check poNo is unique
export const createLine = (req, res) => {
    const data = req.body;
    insertLine(data, (err, results) => {
        if (err){
            res.send(err);
        }else{
            res.json(results);
        }
    });
    
}
//list all purchase orders
export const listPo = (req, res) => {
  listPos((err, results) => {
      if (err){
          res.send(err);
      }else{
          res.json(results);
      }
  });
}
//list all lines
// export const listLine = (req, res) => {
//   listLines((err, results) => {
//       if (err){
//           res.send(err);
//       }else{
//           res.json(results);
//       }
//   });
// }


//retrieve line with po
export const retrieveMyLine = (req, res) => {
  const data = req.body;
  getTheLines(data, (err, results) => {
      if (err){
          res.send(err);
      }else{
          res.json(results);
          console.log(res.json(results))
      }
  });
  
}
//retrieve line with po
export const retrievePo = (req, res) => {
  const data = req.body;
  getThePos(req.params.id, (err, results) => {
      if (err){
          res.send(err);
      }else{
          res.json(results);
          console.log(res.json(results))
      }
  });
  
}