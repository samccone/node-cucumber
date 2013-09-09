module.exports = class Driver
  webdriver = require('selenium-webdriver')
  @_driver   = null

  @build: ->
    @_driver = new webdriver.Builder().withCapabilities(webdriver.Capabilities.chrome()).build()

  @quit: ->
    @_driver.quit()

  @visit: (path) ->
    @_driver.get(path)
