module.exports = ->
  @Given /^I visit "([^"]*)"$/, (link, cb) =>
    @Driver.visit(link).then cb
