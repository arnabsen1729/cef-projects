# script to seed datas into the todo table
require "./connect_db.rb"
require "./todo.rb"
require "date"

connect_db!
Todo.delete_all
Todo.create!(todo_text: "Submit assignment", due_date: Date.today - 1, completed: true)
Todo.create!(todo_text: "Buy groceries", due_date: Date.today + 4, completed: false)
Todo.create!(todo_text: "Call Acme Corp.", due_date: Date.today + 2, completed: true)
Todo.create!(todo_text: "File taxes", due_date: Date.today, completed: false)
