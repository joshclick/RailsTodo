describe "Tests for Task View", ->
  describe 'with fresh task', ->
    taskText = 'sample text'
    
    beforeEach ->
      @model = new window.HAW.todo.models.Task()
      @model.set
        todo_text: taskText
        completed: null

      @view = new window.HAW.todo.views.TaskView
        model: @model
      @view.render()

    it 'correctly displays completion status', ->
      expect @view.$el.find 'input.toggle'
        .not.toBeChecked()
      @view.toggleCompleted()
      expect @view.$el.find 'input.toggle'
        .toBeChecked()

    it 'can click to toggleCompleted', ->
      spyOn window.HAW.todo.views.TaskView.prototype, 'toggleCompleted'
      
      @view.$el.find 'input.toggle'
        .trigger 'click'
        .attr 'checked', 'checked'

      expect window.HAW.todo.views.TaskView.prototype.toggleCompleted
        .toHaveBeenCalled()


    it 'can set to edit', ->
      @view.edit()
      expect @view.$el
        .toHaveClass 'editing'

    it 'can close editing', ->
      @view.close()
      expect @view.$el
        .not.toHaveClass 'editing'

    it 'contains the correct text', ->
      expect @view.$el.find 'label'
        .toHaveText taskText

