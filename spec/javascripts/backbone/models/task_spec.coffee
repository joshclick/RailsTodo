describe "Tests for Task Model", ->
  it "should have default todo_text and completed", ->
    task = new window.HAW.todo.models.Task()

    expect(task.get 'todo_text').toBe ''
    expect(task.get 'completed').toBe null

  it "can be toggled", ->
    task = new window.HAW.todo.models.Task()
    expect(task.get 'completed' ).toEqual null
    task.toggle()
    expect(task.get 'completed' ).not.toEqual null
