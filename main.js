const express = require("express");
const mysql = require("mysql2/promise");

let db = null;
const app = express();

app.use(express.json());

app.post('/create-user', async(req, res, next)=>{
    const fname=req.body.fname;
    const lname=req.body.lname;
    const email=req.body.email;
    const pwd=req.body.pwd;
    const address=req.body.address;
    const ph_no=req.body.ph_no;
    const Age=req.body.Age;
    const uDOB=req.body.uDOB;
    const CNIC=req.body.CNIC;
    const ZIP=req.body.ZIP;
    const City=req.body.City;
    const Country=req.body.Country;
    var values=[[fname],[lname],[email],[pwd],[address],[ph_no],[Age],[uDOB],[CNIC],[ZIP],[City],[Country]];
    await db.query("Insert into user (fname,lname,email,pwd,address,ph_no,Age,uDob,CNIC,ZIP,City,Country) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)",values);
    res.json({status:"ID Successfully Created"});
    next();
  });



  app.get('/login',async(req,res,next)=>{
    
    var [results]= await db.query("Select * from user ");
    res.json(results);
    next();
  });



  async function main(){
    db = await mysql.createConnection({
      host:"localhost",
      user: "root",
      password: "",
      database: "medicine_db",
      timezone: "+00:00",
      charset: "utf8mb4_general_ci",
    });
    app.listen(9000);
}

main();