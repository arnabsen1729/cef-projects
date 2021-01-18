require "./connect_db.rb"
require "date"

class Todo < ActiveRecord::Base
  def self.show_list
    puts "Overdue\n"
    puts self.overdue.to_displayable_list
    puts "\n\n"

    puts "Due Today\n"
    puts self.due_today.to_displayable_list
    puts "\n\n"

    puts "Due Later\n"
    puts self.due_later.to_displayable_list
    puts "\n\n"
  end

  def self.add_task(todo)
    create!(todo_text: todo[:todo_text], due_date: Date.today + todo[:due_in_days], completed: false)
  end

  def self.mark_as_complete!(todo_id)
    update(todo_id, completed: true)
  end

  def due_today?
    due_date == Date.today
  end

  def self.overdue
    where("due_date < ?", Date.today)
  end

  def self.due_today
    where("due_date = ?", Date.today)
  end

  def self.due_later
    where("due_date > ?", Date.today)
  end

  def to_displayable_string
    display_status = completed ? "[X]" : "[ ]"
    display_date = due_today? ? nil : due_date.iso8601
    "#{id} #{display_status} #{todo_text} #{display_date}"
  end

  def self.to_displayable_list
    all.map { |todo| todo.to_displayable_string }
  end
end
