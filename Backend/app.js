const express = require('express');
const morgan = require('morgan');
const userRouter = require('./routes/userRoutes')
const eventRouter = require('./routes/eventRoutes')

const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const User = require('./model/userModel'); 
const app = express();
app.use(express.json());



// MIDDLEWARES ......
app.use(morgan('dev'));
// app.use(express.json());
// app.use((req,res,next)=>{
//     console.log("Hello from th middleware");
//     next();
// })


// app.use('/',userRouter);
app.use('/api/v1/events', eventRouter);
app.post('/signup', async (req, res) => {
    const { username, email, password } = req.body;
  
    try {
      // Check if the username or email is already taken
      const existingUser = await User.findOne({ $or: [{ username }, { email }] });
      if (existingUser) {
        return res.status(400).json({ message: 'Username or email already exists' });
      }
  
      // Create a new user
      const newUser = new User({ username, email, password });
      await newUser.save();
  
      res.status(201).json({ message: 'Signup successful' });
    } catch (error) {
      res.status(500).json({ message: error.message });
    }
  });


app.post('/signin', async (req, res) => {
    const { username, password } = req.body;
  
    try {
      // Find the user by username
      const user = await User.findOne({ username });
      if (!user) {
        return res.status(401).json({ message: 'Invalid username or password' });
      }
  
      // Check if the provided password matches the stored hashed password
      const isPasswordValid = await bcrypt.compare(password, user.password);
      if (!isPasswordValid) {
        return res.status(401).json({ message: 'Invalid username or password' });
      }
  
      // Create and send a JWT token for authentication
      const token = jwt.sign({ userId: user._id }, 'your-secret-key', { expiresIn: '1h' });
      res.json({ token });
    } catch (error) {
      res.status(500).json({ message: error.message });
    }
  });
  





// ROUTERS....



// ROUTES.....

app.get('/',(req,res)=>{
    res.status(200).json({message:'jello from the server side...', number: 1});
})


// CONNECTIONS....

module.exports = app;