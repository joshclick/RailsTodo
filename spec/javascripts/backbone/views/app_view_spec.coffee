describe "Tests for App View", ->
  describe 'rendering', ->

    beforeEach ->
      spyOn window.HAW.todo.collections.Tasks.prototype, 'fetch'
      hawTodo = affix '#hawtodo'
      hawTodo.affix 'input#new-todo'
      hawTodo.affix 'button#clear-completed'

      @app = new window.HAW.todo.views.AppView()

      @app.render()

    it 'calls fetch', ->
      expect window.HAW.todo.collections.Tasks.prototype.fetch
        .toHaveBeenCalled()

    it 'creates on enter', ->
      spyOn window.HAW.todo.collections.Tasks.prototype, 'create'

      @app.$input.val 'sample val'

      e = $.Event 'keypress'
      e.which = 13
      @app.$input.trigger e

      expect window.HAW.todo.collections.Tasks.prototype.create
        .toHaveBeenCalled()

    it 'clears completed on click', ->
      spyOn window.HAW.todo.models.Task.prototype, 'destroy'

      expect window.HAW.todo.models.Task.prototype.destroy
        .toHaveBeenCalled