const Event = require('../model/eventModel');

exports.createEvent = async (req, res) => {
  
    const eventData = req.body;
    console.log(eventData);
    try {
      const newEvent =await  Event.create(req.body);
      res.status(201).json({
        status: "success",
        data:{
          event :newEvent
        }
      });
    } catch (error) {
      res.status(400).json({ 
        status:'Faield to create',
        message: error.message });
    }
  };
  

exports.getAllEvents=async (req, res) => {
    try {
      const events = await Event.find();
      res.json(events);
    } catch (error) {
      res.status(500).json({ message: error.message });
    }
  };

exports.getEvents = async (req, res) => {
    const eventId = req.params.id;
  
    try {
      const event = await Event.findById(eventId);
      if (!event) {
        return res.status(404).json({ message: 'Event not found' });
      }
      res.json(event);
    } catch (error) {
      res.status(500).json({ message: error.message });
    }
  };

  exports.updatedEvent =async (req, res) => {
    const eventId = req.params.id;
    const updatedEventData = req.body;
  
    try {
      const updatedEvent = await Event.findByIdAndUpdate(eventId, updatedEventData, { new: true });
      if (!updatedEvent) {
        return res.status(404).json({ message: 'Event not found' });
      }
      res.json(updatedEvent);
    } catch (error) {
      res.status(400).json({ message: error.message });
    }
  };
  
  // DELETE remove an event by ID
  exports.deletedEvent =async(req, res) => {
    const eventId = req.params.id;
  
    try {
      const deletedEvent = await Event.findByIdAndRemove(eventId);
      if (!deletedEvent) {
        return res.status(404).json({ message: 'Event not found' });
      }
      res.json(deletedEvent);
    } catch (error) {
      res.status(500).json({ message: error.message });
    }
  };