window.HAW.todo.collections.Tasks = Backbone.Collection.extend
    model: window.HAW.todo.models.Task

    url: ->
        if @page > 0
            return '/tasks?' + $.param
                page: @page
        else
            return '/tasks'

    initialize: -> @page = 0

    total: (@total) ->

    setPage: (@page) ->

    completed: -> @filter (task) -> task.get 'completed'

    remaining: -> @without.apply @, @completed()
