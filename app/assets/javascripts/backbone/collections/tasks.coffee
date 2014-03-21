window.HAW.todo.collections.Tasks = Backbone.Collection.extend
    model: window.HAW.todo.models.Task

    url: '/tasks'

    completed: -> @filter (task) -> task.get 'completed'

    remaining: -> @without.apply @, @completed()
