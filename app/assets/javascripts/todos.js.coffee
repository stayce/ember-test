# Create Ember Application
Todos = Ember.Application.create()

# Bind it to the window
window.Todos = Todos

# Define the ToDos model
Todos.Todo = Em.Object.extend
  title: null
  isDone: false
  
# Create the Todos Controller
Todos.todosController = Em.ArrayProxy.create
  content: []
  
  # create a new todo object from the textfield input
  createTodo: (title) ->
    console.log("createTodo() called with title: "+title)
    todo = Todos.Todo.create(title: title)
    @pushObject(todo)

# Create Todos view
Todos.CreateTodoView = Em.TextField.extend # inherit from the textfield object
  insertNewline: -> # new function bound to enter key via ember textfield
    console.log("insertNewline() called with enter key")
    value = @get('value') # grab the value of the input textfield
    
    if value
      console.log("value entered: "+value)
      Todos.todosController.createTodo  (value)
      console.log("create a new todo: "+value+" and clear the input")
      @set('value', '')