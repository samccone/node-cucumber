module.exports = ->
  @Driver = new require("../driver/driver")
  @Widgets = {}

  require("../widgets/google")(@)
