App.Views.Toolbar = Backbone.View.extend
  el: '#toolbar'
  template: JST['toolbar']

  tools:
    "Inline": [
      {name: 'Button', template: 'button'},
      {name: 'Label', template: 'label'}
      # {name: 'Badge', template: 'badge'}
    ]
    "Block": [
      {name: 'Alert', template: 'alert'}
    ]

  initialize: (@app)->
    @render()
    this

  render: ->
    @$el.html @template()

    for group, tools of @tools
      $('.nav').append "<li class='nav-header'>#{group}</li>"
      for tool in tools
        $('.nav').append new App.Views.Tool(tool).el