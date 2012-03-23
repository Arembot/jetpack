#= require underscore
#= require jquery
#= require backbone
#= require handlebars.runtime
#= require_tree ../templates
#= require bootstrap
#= require_self
#= require_tree ./views

class App
  @Views = {}
  @Routers = {}
  @Models = {}
  @Collections = {}
  constructor: ->
    @canvas = $('#canvas')
    @toolbar = new App.Views.Toolbar(this)

window.App = App
$ ->
  window.app = new App()