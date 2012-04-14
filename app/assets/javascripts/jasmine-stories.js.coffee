#=require jquery
#=require jquery_ujs

#=require namespace
#=require jasmine
#=require jasmine-html
#=require jasmine-jquery
#=require jasmine-grammar
#=require jasmine-reporting

# load all jasmine-species features
Namespace.use('jasmine.grammar.FeatureStory.*');
Namespace.use('jasmine.grammar.GWT.*');
Namespace.use('jasmine.grammar.Meta.*');
  
execJasmine = ->
  jasmineEnv.execute()
jasmineEnv = jasmine.getEnv()
jasmineEnv.updateInterval = 1000

window.jsApiReporter = new jasmine.JsApiReporter()
storyReporter = new jasmine.reporting.StyledHtmlReporter()

jasmineEnv.addReporter storyReporter
jasmineEnv.addReporter jsApiReporter

jasmineEnv.specFilter = (spec) ->
  storyReporter.specFilter spec

jasmine.stories = {}
jasmine.stories.autoExecute = true

currentWindowOnload = window.onload
window.onload = ->
  currentWindowOnload()  if currentWindowOnload
  if jasmine.stories.autoExecute
    execJasmine()
