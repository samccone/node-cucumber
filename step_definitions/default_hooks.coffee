module.exports = ->
  @After (cb) =>
    @Driver.quit().then cb

  @Before (cb) =>
    @Driver.build()
    cb()
