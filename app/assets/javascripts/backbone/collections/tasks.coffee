window.HAW.todo.collections.Tasks = Backbone.Collection.extend
    model: window.HAW.todo.models.Task

    url: ->
        '/tasks?' + $.param
            page: @page

    initialize: -> @page = 1

    setPage: (@page) ->

    completed: -> @filter (task) -> task.get 'completed'

    remaining: -> @without.apply @, @completed()
