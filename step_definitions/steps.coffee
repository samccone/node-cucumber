module.exports = ->
  @Given /^I visit "([^"]*)"$/, (link, cb) =>
    @Driver.visit(link, cb)

  @Then /^I can see the google home page$/, (cb) =>
    (new @Widgets.Google).lookup(cb)
