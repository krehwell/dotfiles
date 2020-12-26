const express = require("express");                                                                                                                                  
const router = express.Router();            
 
// NOTE: UNCOMMENT IF  DB AVAILABLE
//const User = require('../model/User.js');

router.get('/', (res, res) => {
  res.send("You are on API route");
})

module.exports = router;
