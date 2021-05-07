require 'faker'
require "open-uri"


puts "creating book seeds"

30.times do
  puts "parsing API"
  file = URI.open("https://www.googleapis.com/books/v1/volumes?q=#{Faker::Book.title}").read
  book_response = JSON.parse(file)
  book = book_response['items'].first['volumeInfo']
  book
  title = book['title']
  puts "adding #{title} to books"
  author = book['authors']
  if author
    author = author.first
  end
  description = book['description']
  category = book["categories"]
  if category
    category = category.first
  end
  rating = book['averageRating']
  image_url = book['imageLinks']['thumbnail']
  file_image = URI.open(image_url)
  book = Book.new(title: title, author: author, summary: description, category: category, rating: rating)
  book.photo.attach(io: file_image, filename: "nes.png", content_type: 'image/png')
  book.save
  puts "saved #{title} to books"
end

puts "finished book seeds"
