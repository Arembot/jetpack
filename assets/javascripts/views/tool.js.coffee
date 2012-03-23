App.Views.Tool = Backbone.View.extend
  tagName: 'li'
  template: JST["tool"]

  initialize: (data)->
    @data = data
    @render()

  events:
    'click': 'addToCanvas'

  render: (options)->
    @$el.html @template(@data)
    this

  modal: (callback)->
    modalElement = $(JST["forms/#{@data.template}"]())
    modalElement.modal()
    $('body').append(modalElement)
    modalElement.find('form').on 'submit', =>
      vals = {}
      $(modalElement.find('form :input')).each ->
        vals[$(this).attr('name')] = $(this).val()
      callback.call(this, vals)
      modalElement.modal('hide').remove()
      false

  addToCanvas: ->
    @modal (config)->
      app.canvas.append JST["tools/#{@data.template}"](config)