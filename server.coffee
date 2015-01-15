config =  require(if process.argv[2] then "./config/" + process.argv[2] else "./config/local.coffee") 

express = require "express"
app = express()
bodyParser = require "body-parser"
mongoose = require 'mongoose'
mongoose.connect "#{config.db_url}/#{config.db}"
validator = require "express-validator"

http = require 'http'
server = http.createServer app
io = require('socket.io').listen server
app.use bodyParser.json()
require("./validators.coffee")(validator, app)
require("./routing.coffee")(app, io)

console.log "enjoy coffee on #{config.app_port}"

app.listen config.app_port

