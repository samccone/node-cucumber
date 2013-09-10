module.exports = ->
  @Given /^I visit "([^"]*)"$/, (link, cb) =>
    @Driver.visit(link).then cb

  @Then /^I can see the google home page$/, (cb) =>
    (new @Widgets.Google).lookup().then -> cb()
