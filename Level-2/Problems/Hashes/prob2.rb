# Problem 2. Given this list of todos, create a Hash keyed by category, whose value is an array containing all the todos in that category. The keys of the Hash must be a symbol.

todos = [
  ["Send invoice", "money"],
  ["Clean room", "organize"],
  ["Pay rent", "money"],
  ["Arrange books", "organize"],
  ["Pay taxes", "money"],
  ["Buy groceries", "food"],
]

todo_hash = {}
todos.each do |todo|
  category = todo[1].to_sym
  todo_hash[category] ||= [] # initialising with empty array if it is nil
  todo_hash[category].push(todo[0])
end

puts todo_hash
