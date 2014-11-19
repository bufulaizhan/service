module.exports = (router, io)->
  Topic = require "../models/topic.coffee"
  router.post "/topic", (req, res)->
    
