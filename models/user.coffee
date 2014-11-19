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

UserSchema.pre 'save', (next)->
  self = @
  mongoose.model('User').findOne username: @username, 'username', (error, result)->
    if error
      next error
    else if result
      self.invalidate "username","username must be unique"
      next new Error("username must be unique")
    else
      next()
