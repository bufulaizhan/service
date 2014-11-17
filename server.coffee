express = require "express"
app = express()
bodyParser = require "body-parser"
config = require "./config"

mongoose = require 'mongoose'
mongoose.connect "#{config.db_url}/#{config.db}"

validator = require "express-validator"


http = require 'http'
server = http.createServer app
io = require('socket.io').listen server
app.use bodyParser.json()
app.use validator()


require("./routing.coffee")(app, io, validator)


console.log "enjoy coffee on #{config.app_port}"



app.listen config.app_port


