mongoose = require "mongoose"
Schema = mongoose.Schema

UserSchema = mongoose.Schema(
  username: String
  from: String
  oauthToken: String
  token: String
  timestamp:
    type: Date
    default: Date.now
  updateTime:
    type: Date
    default: Date.now
)

module.exports = mongoose.model 'User', UserSchema