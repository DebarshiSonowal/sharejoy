const mongoose = require('mongoose');
const dotenv = require('dotenv')
dotenv.config({path: './config.env'});
const app = require('./app');

const DB =process.env.DATABASE;
mongoose.connect(DB,{
    useNewUrlParser: true,
    useCreateIndex: true,
    useFindAndModify: false
}).then(()=>console.log(`DB connection successfull!`))

// const eventSchema = new mongoose.Schema({
//     id: {
//       type: String,
//       required: true,
//       unique: true,
//     },
//     venue: {
//       type: String,
//       required: true,
//     },
//     dateTime: {
//       type: Date,
//       // required: true,
//     },
//     quantity: {
//       type: Number,
//       required: true,
//     },
//     latitude: {
//       type: Number,
//       required: true,
//     },
//     longitude: {
//       type: Number,
//       required: true,
//     },
//   });
  
//   const Event = mongoose.model('Event', eventSchema);

  
//   const newEvent = new Event({
//     id: "2",
//     venue: "Example Venue",
//     dateTime: "2024-01-20T12:00:00Z",
//     quantity: 100,
//     latitude: 37.7749,
//     longitude: -122.4194
//   })

//   newEvent.save().then(doc =>{
//     console.log(doc);
//   }).catch(err =>{
//     console.log(err)
//   } );
  

// console.log(process.env);
const port =process.env.PORT||3000;
app.listen(port, ()=>{
    console.log(`App running on port ${port}.....`)
})



