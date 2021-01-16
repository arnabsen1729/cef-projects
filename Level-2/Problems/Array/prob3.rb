# Problem 3. Print the given list of todos by category. (You haven't learned Hashes yet, so use only arrays.)

todos = [
  ["Send invoice", "money"],
  ["Clean room", "organize"],
  ["Pay rent", "money"],
  ["Arrange books", "organize"],
  ["Pay taxes", "money"],
  ["Buy groceries", "food"],
]

categories = (todos.map { |todo| todo[1] }).uniq

categories.each do |category|
  puts "#{category}:"
  todos_for_this_category = todos.select { |todo| todo[1] == category }
  todos_for_this_category.each do |todo|
    puts "  #{todo[0]}"
  end
end
