# Problem 2. Given two arrays books and authors, merge them and print who wrote which book.

books = ["Design as Art", "Anathem", "Shogun"]
authors = ["Bruno Munari", "Neal Stephenson", "James Clavell"]
puts books.map.with_index { |book, index| "#{book} was written by #{authors[index]}" }
