module.exports = (router, io)->
  Topic = require "../models/topic.coffee"
  User = require "../models/user.coffee"
  Utils = require "../utils.coffee"

  router.post "/signup", (req, res)->
    user = new User()
    user.username = req.body.username
    user.from = 'native'
    # validator
    req.checkBody('username', 'Not null').notEmpty()
    Utils.validate req.validationErrors(), res, ()->
      user.save (error, saved)->
        if error
          console.log error
          res.status(400).send(error.message)
        else
          res.send saved

