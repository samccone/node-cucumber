module.exports = ->
  @After (cb) =>
    @Driver.quit => cb()

  @Before (cb) =>
    @Driver.build => cb()
