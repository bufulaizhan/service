crypto = require "crypto"

module.exports =
  genUUID: ->
    'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, (c) ->
      r = Math.random() * 16 | 0
      v = if c is 'x' then r else (r & 0x3 | 0x8)
      v.toString(16)
    )
  validate: (errors, res, callback)->
    if errors
      res.send " #{JSON.stringify(errors)}", 400
    else
      callback()

