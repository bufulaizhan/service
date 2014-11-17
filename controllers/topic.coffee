module.exports = (router, io, validator)->
  Topic = require "../models/topic.coffee"
  router.post "/topic", (req, res)->
    
