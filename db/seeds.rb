require 'faker'
require "open-uri"


User.destroy_all
Book.destroy_all
BookReview.destroy_all
CatalogItem.destroy_all
Chatroom.destroy_all
Comment.destroy_all

puts "creating users"

User.create!(email: 'dg@gmail.com', password: 123456, first_name: "Daniel")
puts "created Daniel"
User.create!(email: 'mm@gmail.com', password: 123456, first_name: "Moshe")
puts "created Moshe"
User.create!(email: 'hg@gmail.com', password: 123456, first_name: "Hugo")
puts "created Hugo"
User.create!(email: 'sa@gmail.com', password: 123456, first_name: "Shane")
puts "created Shane"

puts "creating book seeds"

1.times do
  puts "parsing API"
  file = URI.open("https://www.googleapis.com/books/v1/volumes?q=#{Faker::Book.title}").read
  book_response = JSON.parse(file)
  book = book_response['items'].first['volumeInfo']
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
  if book['averageRating']
    rating = book['averageRating']
  end
  image_url = book['imageLinks']['thumbnail']
  file_image = URI.open(image_url)
  book = Book.new(title: title, author: author, summary: description, category: category, rating: rating)
  book.photo.attach(io: file_image, filename: "nes.png", content_type: 'image/png')
  book.save
  puts "saved #{title} to books"
end

puts "finished book seeds"

puts "creating book reviews"

1.times do
  BookReview.create!(user: User.all.sample, book: Book.all.sample, content: Faker::Lorem.paragraph(sentence_count: rand(2..6)), rating: rand(1..5))
end

puts "finsihed creating book reviews"

puts "creating catalog items"

quality_arr = ["mint condition", "pretty good", "ok", "slightly ripped", "not great"]

1.times do
  CatalogItem.create!(quality: quality_arr.sample, user_summary: Faker::Lorem.paragraph(sentence_count: rand(2..4)), available: rand(1..2) == 1 ? true : false, user: User.all.sample, book: Book.all.sample)
end

puts "finished creating catalog items"

puts "creating chatrooms"

1.times do
  user1 = User.all.sample
  user_arr = User.all.filter { |user| user != user1 }
  Chatroom.create!(user1: user1, user2: user_arr.sample)
end

puts "finished creating chatrooms"

puts "creating comments"

4.times do
  comment = Comment.new(user: User.all.sample, book: Book.all.sample, content: Faker::Lorem.paragraph(sentence_count: rand(2..4)))
  comment.parent = rand(1..4) == 1 ? nil : Comment.all.sample
  comment.save
end

puts "finished creating comments"












