module.exports = (router, io)->
  Topic = require "../models/topic.coffee"
  User = require "../models/user.coffee"
  Utils = require "../utils.coffee"

  router.post "/signup", (req, res)->
    user = new User()
    user.username = req.body.username
    user.from = 'native'
    user.save (e, r)->



