window.HAW.todo.views.AppView = Backbone.View.extend
    el: '#hawtodo'

    events:
        'keypress #new-todo': 'createOnEnter'
        'click #clear-completed': 'clearCompleted'

    initialize: ->
        @tasks = new window.HAW.todo.collections.Tasks()

        @$input = @$('#new-todo')
        @$footer = @$('#footer')
        @$main = @$('#main')
        @$list = $('#todo-list')

        @listenTo @tasks, 'add', @addOne
        @listenTo @tasks, 'reset', @addAll
        @listenTo @tasks, 'all', @render

        @tasks.fetch
            reset: true


    render: ->
        completed = @tasks.completed().length
        remaining = @tasks.remaining().length.toString()

        if @tasks.length
            @$main.show()
            @$footer.show()

            self = @
            dust.render 'todo-stats', { completed: completed, remaining: remaining }, (err, out) ->
                $(self.$footer).html out

        else
            @$main.hide()
            @$footer.hide()

    addOne: (task) ->
        view = new window.HAW.todo.views.TaskView
            model: task
        @$list.append view.render().el

    addAll: ->
        @$list.html ''
        @tasks.each @addOne, @

    createOnEnter: (e) ->
        if e.which is ENTER_KEY and @$input.val().trim()
            @tasks.create
                todo_text: @$input.val().trim()
            @$input.val ''

    clearCompleted: ->
        _.invoke @tasks.completed(), 'destroy'

app = new window.HAW.todo.views.AppView()
Backbone.history.start()
ENTER_KEY = 13
ESC_KEY = 27;
