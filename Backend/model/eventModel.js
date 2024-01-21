const mongoose = require('mongoose');

const eventSchema = new mongoose.Schema({
  id: {
    type: String,
    required: true,
    unique: true,
  },
  venue: {
    type: String,
    required: true,
  },
  dateTime: {
    type: Date,
    required: true,
  },
  quantity: {
    type: Number,
    required: true,
  },
  latitude: {
    type: Number,
    required: true,
  },
  longitude: {
    type: Number,
    required: true,
  },
});

const Event = mongoose.model('Event', eventSchema);

module.exports = Event;
