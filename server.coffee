express = require "express"
app = express()
bodyParser = require "body-parser"
config = require "./config"

mongoose = require 'mongoose'
mongoose.connect "#{config.db_url}/#{config.db}"


http = require 'http'
server = http.createServer app
io = require('socket.io').listen server

require("./routing.coffee")(app,io)


console.log "enjoy coffee on #{config.app_port}"



app.use bodyParser.json()
app.listen config.app_port


