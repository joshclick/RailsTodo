window.HAW.todo.views.TaskView = Backbone.View.extend
    tagName: 'li'

    events:
        'click .toggle': 'toggleCompleted'
        'dblclick label': 'edit'
        'click .destroy': 'clear'
        'keypress .edit': 'updateOnEnter'
        'keydown .edit': 'revertOnEscape'
        'blur .edit': 'close'

    initialize: ->
        @listenTo @model, 'change', @render
        @listenTo @model, 'destroy', @remove

    render: ->
        self = @
        dust.render 'list-item', @model.toJSON(), (err, out) ->
            $(self.el).html out

        @$el.toggleClass 'completed', (@model.get 'completed') is not null
        @$input = @$ '.edit'
        return @

    toggleCompleted: ->
        @model.toggle()

    edit: ->
        @$el.addClass 'editing'
        @$input.focus()

    close: ->
        value = @$input.val()
        trimmedValue = value.trim()

        return if !@$el.hasClass 'editing'

        if trimmedValue
            @model.save
                todo_text: trimmedValue

            if value is not trimmedValue
                @model.trigger 'change'

        else
            @clear()

        @$el.removeClass 'editing'


    updateOnEnter: (e) ->
        @close() if e.which is window.ENTER_KEY

    revertOnEscape: (e) ->
        @$el.removeClass 'editing' if e.which is window.ESC_KEY

    clear: ->
        @model.destroy()
