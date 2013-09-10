class Driver
  webdriver  = require('selenium-webdriver')
  @_driver   = null

  ### Potential Scopes
    className
    'class name'
    css
    id
    js
    linkText
    'link text'
    name
    partialLinkText
    'partial link text'
    tagName
    'tag name'
    xpath
  ###
  @find: (scope, selector) ->
    @_driver.findElement(webdriver.By[scope](selector))

  @findOne: @find

  @build: ->
    @_driver = new webdriver.Builder().withCapabilities(webdriver.Capabilities.chrome()).build()

  @quit: ->
    @_driver.quit()

  @visit: (path) ->
    @_driver.get(path)

module.exports = Driver
