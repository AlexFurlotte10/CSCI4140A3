<template>
 
<div id="parts">
<header>
    <h1>Welcome to the part store</h1>
    <h3>Alex, Ryan and Noah built this using Vue.js, Node,js, Express.js, and MySQL</h3>
</header>


    <!-- <div>
        <h4>Insert client info (204)</h4>
        <form ID="Insert Client Info">
            <input placeholder="Client ID" type="text" id="ClientInfo" name="ClientInfo">
            <input type="submit" value="Submit">
        </form>
    </div> -->
    
        <br />
        <div>
    
     

   
    <h4>List of Available Parts for Purchase</h4>
  <ul v-for="part in parts" :key="part.P_No204" style="list-style:none;">
          <li>Part Name: {{ part.P_Name204 }}</li>
          <li>Part Number: {{ part.P_No204 }}</li>
          <li>Price: ${{ part.P_CurrentPrice204 }}</li>
  </ul>
  
        
        
   
  </div>
        <br />
        <div>
          <h2>Company Z Part Store</h2>
          <h3>Submit PO</h3>
    <div class="field">
      <label class="label">Purchase order number</label>
      <div class="control">
        <input
          class="input"
          type="text"
          placeholder="Purchase order number"
          v-model="purchaseOrder"
        />
      </div>
    </div>
  
    <div class="field">
      <label class="label">Client ID</label>
      <div class="control">
        <input
          class="input"
          type="text"
          placeholder="ClientID"
          v-model="clientID"
        />
      </div>
    </div>
    <div class="field">
      <label class="label">Part Number</label>
      <div class="control">
        <input
          class="input"
          type="text"
          placeholder="Part Number"
          v-model="partNumber"
        />
      </div>
    </div>
  <div class="field">
      <label class="label">Date</label>
      <div class="control">
        <input
          class="input"
          type="text"
          placeholder="Date"
          v-model="date"
        />
      </div>
    </div>
    
    <div class="control">
      <button class="button is-success" @click="saveProduct">Save</button>
    </div>

              <!-- <h3>Find PO</h3>

   <div class="field">
      <label class="label">Parts in your purchase order</label>
      <div class="control">
        <input
          class="input"
          type="text"
          placeholder="PO number"
          v-model="poNumber"
        />
      </div>
    </div>
    
    <div class="control">
      <button class="button is-success" @click="saveProduct">Find</button>
    </div> -->
  </div>
        <br />
        <div>
          <h3>Submit Line</h3>
    <div class="field">
      <label class="label">Part Number</label>
      <div class="control">
        <input
          class="input"
          type="text"
          placeholder="Part Number"
          v-model="partNumber"
        />
      </div>
    </div>
  
    <div class="field">
      <label class="label">Quantity Ordered</label>
      <div class="control">
        <input
          class="input"
          type="text"
          placeholder="Quantity Ordered"
          v-model="quantityOrdered"
        />
      </div>
    </div>
  <div class="field">
      <label class="label">Price</label>
      <div class="control">
        <input
          class="input"
          type="text"
          placeholder="Price"
          v-model="price"
        />
      </div>
    </div>
    <div class="field">
      <label class="label">Purchase Order Number</label>
      <div class="control">
        <input
          class="input"
          type="text"
          placeholder="Purchase Order Number"
          v-model="purchaseOrderNumber"
        />
      </div>
    </div>
    
    <div class="control">
      <button class="button is-success" @click="saveLine">SAVE</button>
    </div> 
  </div> 
        <br />
         

   
    <h3>List of POs</h3>
  <ul v-for="item in items" :key="item.ZPOs_PoNo204" style="list-style:none;">
          <li>PO Number: {{ item.ZPOs_PoNo204 }}</li>
          <li>Client ID: {{ item.ZPOs_ClientCompID204 }}</li>
          <li>PO Date: {{ item.ZPOs_DateofPO204 }}</li>

          
  </ul>

  
 

    
        <br />
         
    <div class="field">
      <label class="label">Find Your Line Number</label>
      <div class="control">
        <input
          class="input"
          type="text"
          placeholder="Line Number"
          v-model="lineNum"
        />
      </div>
    </div>
    
    <div class="control">
      <button class="button is-success" @click="retrieveLine">Find</button>
    </div>  
</div> 



</template>

<script>
// import axios
import axios from "axios";
  
export default {
  name: "ProductList",
  data() {
    return {
      items: [],
      parts: [],
      purchaseOrder: "",
      clientID: "",
      date: "",
      partNumber: "",
      price: "",
      quantityOrdered: "",
      purchaseOrderNumber: "",
      purchaseOrderNumber2: "",
      lineNumber: "",
      lineNum: "",
      clientID2: "",
      
    };
  },
  
  created() {
    this.getProducts();
    this.getPo();
    //this.getLine();
  },
  
  methods: {
    // Get All Products
    async getProducts() {
      try {
        const response = await axios.get("http://localhost:5002/xy/products");
        this.parts = response.data;
        console.log(response.data)
      } catch (err) {
        console.log(err);
      }
    },
    async saveProduct() {
      try {
        await Promise.all([axios.post("http://localhost:5002/xy/xproducts", {
          XPOs_PoNo204: this.purchaseOrder,
          XPOs_ClientCompID204: this.clientID,
          XPOs_DateofPO204: this.date,          
        }),axios.post("http://localhost:5002/xy/yproducts", {
          YPOs_PoNo204: this.purchaseOrder,
          YPOs_ClientCompID204: this.clientID,
          YPOs_DateofPO204: this.date,
        }),axios.post("http://localhost:5002/products", {
          ZPOs_PoNo204: this.purchaseOrder,
          ZPOs_ClientCompID204: this.clientID,
          ZPOs_DateofPO204: this.date,
        })
        ]);
        
        this.purchaseOrder = "";
        this.clientID = "";
        this.date = "";
        this.$router.push("/");
      } catch (err) {
        console.log(err);
      }
    },
    async saveLine() {
      try {
        await axios.post("http://localhost:5002/xy/line", {
          Z_PartNo204: this.partNumber,
          Z_PriceOrdered204: this.price,
          Z_QTY204: this.quantityOrdered,
          Z_PoNo204: this.purchaseOrderNumber,          
        });
        this.partNumber = "";
        this.price = "";
        this.quantityOrdered = "";
        this.purchaseOrderNumber = "";
        this.$router.push("/");
      } catch (err) {
        console.log(err);
      }
    },
    // List all PO
    async getPo() {
      try {
        const response = await axios.get("http://localhost:5002/productsorders");
        this.items = response.data;
      } catch (err) {
        console.log(err);
      }
    },
    
     async retrievePurchaseOrder() {
      try {
        await axios.get("http://localhost:5002/productsOrder", {
          POs_ClientCompID: this.clientID2,
        });
        this.clientID2 = "";
        
        this.$router.push("/");
      } catch (err) {
        console.log(err);
      }
    },
    
//     // List all Lines
//     async getLine(lineNumber) {
//       let i
//       let lineNum
//       for(i in listLine.length()){
//         if(lineNum == this.listLine[i]){
//         lineNum = lineNumber
//       }
//         return lineNum;
//       }
  
    
//  },
 async retrieveLine() {
  console.log(this.lineNum);
      try {
        await axios.get("http://localhost:5002/productsLines", {
          Z_LineNo204: this.lineNum,
        });
        this.lineNum = "";
        
        this.$router.push("/");
      } catch (err) {
        console.log(err);
      }
    },
  }
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
#parts {
        text-align: center;
    }
    table{
      text-align: center;
    }
    td{
      text-align: center;
    }
    th{
      text-align: center;
    }
</style>