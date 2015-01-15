request = require 'request'

describe 'ping-test', ->
  it 'must pass', ()->
    expect(1+2).toEqual(3)

  it 'should return pong when visit ping', (done)->
    request 'http://localhost:1024/api/ping', (error, response, body)->
      expect(body).toEqual 'pong'
      done()
