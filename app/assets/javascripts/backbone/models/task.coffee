window.HAW.todo.models.Task = Backbone.Model.extend
    url: '/tasks'

    defaults:
      todo_text: ''
      completed: null

    toggle: ->
        completed =
            if @get('completed')?
            then null
            else new Date()

        @save
            completed: completed
