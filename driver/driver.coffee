$      = require('when')
Assert = require('assert')

class Driver
  webdriverjs = require('webdriverjs')
  seleniumLauncher = require('selenium-launcher')

  constructor: (host, port) ->
    @host     = host
    @port     = port
    @_driver  = null
    @

  pageReady: (cb) ->
    @_driver.getTitle(cb)

  find: (selector, cb) ->
    @_driver.isVisible selector, (err, found) ->
      Assert.equal found, true, "the #{selector} element is not visible"
      cb()

  findAll: (selector, cb) ->
    @_driver.elements 'css selector', selector, cb

  get: (selector) ->
    deferred = $.defer()
    @_driver.getValue selector, (e, d) ->
      if e
        deferred.reject(e)
      else
        deferred.resolve(d)

    deferred.promise

  set: (selector, value, cb) ->
    deferred = $.defer()
    @_driver.setValue selector, value, -> deferred.resolve()
    deferred.promise

  click: (selector, cb) ->
    @_driver.click selector, cb

  build: (cb) ->
    seleniumLauncher (e, selenium) =>
      @_driver = webdriverjs.remote
        port: selenium.port
        host: selenium.host
        desiredCapabilities:
          browserName: 'chrome'
      @_driver.init cb

  refresh: (cb) ->
    @_driver.refresh cb

  quit: (cb) ->
    @_driver.end cb

  visit: (path, cb) ->
    if @host? and @port?
      composedPath = "#{@host}:#{@port}#{path}"
    else
      composedPath = path

    @_driver.url composedPath, =>
      # waits for the page to have a title (thus fully loaded)
      @pageReady cb

module.exports = Driver
