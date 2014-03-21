window.HAW.todo.views.AppView = Backbone.View.extend
    el: '#hawtodo'

    events:
        'keypress #new-todo': 'createOnEnter'
        'click #clear-completed': 'clearCompleted'
        'click .next-page': 'nextPage'
        'click .prev-page': 'prevPage'

    initialize: ->
        @tasks = new window.HAW.todo.collections.Tasks()

        @$input = @$ '#new-todo'
        @$footer = @$ '#footer'
        @$main = @$ '#main'
        @$list = $ '#todo-list'
        @perPage = 10

        @listenTo @tasks, 'add', @addOne
        @listenTo @tasks, 'reset', @addAll
        @listenTo @tasks, 'all', @render

        self = @
        @tasks.fetch
            reset: true
            success: (collection, resp) ->
                console.log collection
                self.totalLen = collection.length
                self.nextPage()


    render: ->
        completed = @tasks.completed().length
        remaining = @tasks.remaining().length.toString()
        maxPageBool = (@tasks.page || 1) >= Math.ceil @totalLen / @perPage
        minPageBool = (@tasks.page || 1) <= 1

        if @tasks.length
            @$main.show()
            @$footer.show()

            self = @
            dust.render 'todo-stats', { completed: completed, remaining: remaining, maxPage: maxPageBool, minPage: minPageBool }, (err, out) ->
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
        if e.which is window.ENTER_KEY and @$input.val().trim()
            @tasks.create
                todo_text: @$input.val().trim()
            @$input.val ''

    clearCompleted: ->
        _.invoke @tasks.completed(), 'destroy'

    nextPage: ->
        newPageNum = Math.ceil @totalLen / @perPage

        if @tasks.page >= newPageNum
            @tasks.page = newPageNum
        else
            @tasks.page++
            @tasks.fetch
                reset: true

    prevPage: ->
        if @tasks.page <= 1
            @tasks.page = 1
        else
            @tasks.page--
            @tasks.fetch
                reset: true

app = new window.HAW.todo.views.AppView()
Backbone.history.start()