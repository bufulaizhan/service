config =  require(if process.argv[2] then "./config/" + process.argv[2] else "./config/local.coffee")

seedSequence = ['beforeRun','run','afterRun']
mongoose = require 'mongoose'
mongoose.connect "#{config.db_url}/#{config.db}"

fs = require 'fs'
fs.readdirSync("#{__dirname}/seeds/").forEach (name)->
  fileExtensions = /^.*\.coffee$/
  if fileExtensions.test name
    seed = require("#{__dirname}/seeds/#{name}")()
    seedSequence.forEach (fn)->
      seed[fn]() if seed[fn]
