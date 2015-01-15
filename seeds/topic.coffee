module.exports = -> 
  Topic = require '../models/topic.coffee'
  beforeRun: ->
    console.log "ready to run"
  run: ->
    console.log "run"
  afterRun: ->
    console.log "after run"
