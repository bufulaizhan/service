module.exports = (router, io, validator)->
  Topic = require "../models/topic.coffee"
  User = require "../models/user.coffee"
  Utils = require "../utils.coffee"

  router.post "/signup", (req, res)->
    user = new User()
    user.username = req.body.username
    user.from = 'native'
    # validator
    req.checkBody('username', 'Not null').notEmpty().isInt()
    Utils.validate req.validationErrors(), res, ()->
      res.send "ok", 201

