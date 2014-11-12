express = require "express"
app = express()
bodyParser = require 'body-parser'
router = require('express').Router()
port = 1024

router.route('/ping').get (req, res)->
  res.send "pong"

console.log 'enjoy coffee'

app.use bodyParser.json()
app.use '/api', router
app.listen port


