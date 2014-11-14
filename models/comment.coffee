mongoose = require "mongoose"
Schema = mongoose.Schema

TopicSchema = mongoose.Schema(
  description: String
  stand: String
  author: String
  timestamp:
    type: Date
    default: Date.now
  updateTime:
    type: Date
    default: Date.now
)

module.exports = mongoose.model 'Comment', CommentSchema