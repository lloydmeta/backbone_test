class TodoList.Views.TasksIndex extends Backbone.View
  el: '#app'
  template: JST['tasks/index']
  events:
    'keypress #add-task' :'createOnEnter'
  initialize: ->
    @collection.bind 'reset', @render, @
    @collection.bind 'add',@addTask, @
  render: ->
    $(@el).html(@template())

    @collection.each (task) =>
      view = new TodoList.Views.TasksItem model: task
      @$('#tasks').append(view.render().el)
    @
  createOnEnter: (event) ->
    return if event.keyCode != 13
    @collection.create name: @$('#add-task').val()
    @$('#add-task').val('')
  addTask: (task) ->
    view = new TodoList.Views.TasksItem model: task
    @$('#tasks').append(view.render().el)
    @