_World = null

class Google
  lookup: (cb) ->
    _World.Driver.find('#viewport', cb)

module.exports = (World) ->
  _World = World
  World.Widgets.Google = Google
