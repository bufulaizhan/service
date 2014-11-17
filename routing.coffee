fs = require "fs"

module.exports = (app, io, validator)->
  router = require("express").Router()
  router.use (req, res, next)->
    console.log "#{Date.now()} [#{req.ip}] plugged in:#{req.originalUrl } by [#{req.method}]"
    next()

  router.get "/ping", (req, res)->
    res.send "pong"


  fs.readdirSync("#{__dirname}/controllers/").forEach (name)->
    require("#{__dirname}/controllers/#{name}")(router, io, validator)
    app.use('/api', router);