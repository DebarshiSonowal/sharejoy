const express = require('express');
const eventController = require('./../controller/eventController');

const eventRouter = express.Router(); 

eventRouter.param('id',(req,res,next,val)=>{
    console.log(`Event id is: ${val}`);
    next();
})

eventRouter.route('/').get(eventController.getAllEvents).post(eventController.createEvent)
eventRouter.route('/:id').get(eventController.getEvents).patch(eventController.updatedEvent).delete(eventController.deletedEvent);

module.exports = eventRouter;