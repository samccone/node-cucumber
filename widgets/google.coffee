_World = null

class Google
  constructor: ->
    _World.Driver.find('id', 'viewport')

module.exports = (World) ->
  _World = World
  World.Widgets.Google = Google
