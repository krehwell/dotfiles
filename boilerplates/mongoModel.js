const mongoose = require('mongoose');
const Schema = mongoose.Schema; 
                                                                                                                                                                         
// Create User Schema
const UserSchema = new Schema({
  name:{
    type: String,
    required: true
  },
  email:{
    type: String,
    required: true,
    unique: true,  // must be unique
    dropDups: true // don't allow duplicate data
  },
  password:{
    type: String,
    required: true
  },
  date:{
    type: Date,
    default: Date.now
  }
});

module.exports = User = mongoose.model("users", UserSchema);
