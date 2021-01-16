# Problem 1. Given two arrays books and authors, merge them into a single Hash. The keys of the Hash must be the lower-cased firstname of the authors, and must be symbols.
books = ["Design as Art", "Anathem", "Shogun"]
authors = ["Bruno Munari", "Neal Stephenson", "James Clavell"]

book_hash = {}

authors.each_with_index do |author, index|
  fname = (author.split(" ")[0]).downcase
  book = books[index]
  book_hash[fname.to_sym] = book
end

puts book_hash
