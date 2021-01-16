# Problem 1. Given a nested array of first names and last names, return a new array with the full names.

names = [["Jhumpa", "Lahiri"], ["J. K", "Rowling"], ["Devdutt", "Pattanaik"]]
full_names = names.map { |name| name.join(" ") }
puts full_names
