// import express
import express from "express";
// import cors
import cors from "cors";

import bodyParser from "body-parser";

// import routes
import Router from "./routes/routes.js";
import xyRouter from "./routes/xy.routes.js";

// init express
const app = express();

// use express json
app.use(express.json());

// use cors
app.use(cors());

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// use router
app.use(Router);
app.use("/xy", xyRouter);

app.listen(5002, () => console.log("Server running at http://localhost:5002"));
