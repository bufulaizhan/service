mongoose = require "mongoose"
Schema = mongoose.Schema

StandSchema = mongoose.Schema(
  title: String
  topic: String
  owner: String
  timestamp:
    type: Date
    default: Date.now
  updateTime:
    type: Date
    default: Date.now
)

module.exports = mongoose.model 'Stand', StandSchema