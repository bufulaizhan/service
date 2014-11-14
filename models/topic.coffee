mongoose = require "mongoose"
Schema = mongoose.Schema

TopicSchema = mongoose.Schema(
  title: String
  author: String
  description: String
  timestamp:
    type: Date
    default: Date.now
  updateTime:
    type: Date
    default: Date.now

)

module.exports = mongoose.model 'Topic', TopicSchema