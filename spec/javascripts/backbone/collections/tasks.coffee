describe "Tests for Tasks Collection", ->
  it "should properly calculate completed and remaining", ->
    tasks = new window.HAW.todo.collections.Tasks()
    # tasks.length is 0
    expect(tasks.completed().length + tasks.remaining().length).toEqual tasks.length
