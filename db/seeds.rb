require 'faker'
require "open-uri"


User.destroy_all
Book.destroy_all
BookReview.destroy_all
CatalogItem.destroy_all
Chatroom.destroy_all
Comment.destroy_all
Message.destroy_all
CatalogItem.destroy_all
UserReview.destroy_all


puts "creating users"

user = User.new(email: 'dg@gmail.com', password: 123456, first_name: "Daniel", address: "13 shimshon, Jerusalem")
file_image = URI.open(Faker::Avatar.image)
user.photo.attach(io: file_image, filename: "nes.png", content_type: 'image/png')
user.save
puts "created Daniel"
user = User.new(email: 'mm@gmail.com', password: 123456, first_name: "Moshe", address: "9 ahad haam, Tel Aviv")
file_image = URI.open(Faker::Avatar.image)
user.photo.attach(io: file_image, filename: "nes.png", content_type: 'image/png')
user.save
puts "created Moshe"
user = User.new(email: 'hg@gmail.com', password: 123456, first_name: "Hugo", address: "8 ahad haam, Tel Aviv")
file_image = URI.open(Faker::Avatar.image)
user.photo.attach(io: file_image, filename: "nes.png", content_type: 'image/png')
user.save
puts "created Hugo"
user = User.new(email: 'sa@gmail.com', password: 123456, first_name: "Shane", address: "44 hakishon, Tel Aviv")
file_image = URI.open(Faker::Avatar.image)
user.photo.attach(io: file_image, filename: "nes.png", content_type: 'image/png')
user.save
puts "created Shane"

puts "creating book seeds"

40.times do
  puts "parsing API"
  fake_book = Faker::Book.title
  puts fake_book
  if (Book.all.any? { |book| book.title == fake_book }) || (!(file = URI.open("https://www.googleapis.com/books/v1/volumes?q=#{fake_book}").read))
    next
  else
    file = URI.open("https://www.googleapis.com/books/v1/volumes?q=#{fake_book}").read
    book_response = JSON.parse(file)
    book = book_response['items'].first['volumeInfo']
    title = fake_book
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
    new_book = Book.new(title: title, author: author, summary: description, category: category, rating: rating)
    if book['imageLinks']
      image_url = book['imageLinks']['thumbnail']
      file_image = URI.open(image_url)
      new_book.photo.attach(io: file_image, filename: "nes.png", content_type: 'image/png')
    else
      image_url = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6Dw1Etemhe9K_LEK8pXzVO0X2tnqkMW8q4Q&usqp=CAU"
      file_image = URI.open(image_url)
      new_book.photo.attach(io: file_image, filename: "nes.png", content_type: 'image/png')
    end
    new_book.save
    puts "saved #{title} to books"
  end
end

puts "finished book seeds"

puts "creating book reviews"

50.times do
  BookReview.create!(user: User.all.sample, book: Book.all.sample, content: Faker::Lorem.paragraph(sentence_count: rand(2..6)), rating: rand(1..5))
end

puts "finsihed creating book reviews"

puts "creating catalog items"

quality_arr = ["mint condition", "pretty good", "ok", "slightly ripped", "not great"]
60.times do
  CatalogItem.create!(quality: quality_arr.sample, available: rand(1..2) == 1 ? true : false, user: User.all.sample, book: Book.all.sample)
end

puts "finished creating catalog items"

puts "creating chatrooms"

6.times do
  user1 = User.all.sample
  user_arr = User.all.filter { |user| user != user1 }
  user2 = user_arr.sample
  chatrooms = Chatroom.all.filter { |room| (room.user1 == user1 && room.user2 == room.user2) || (room.user2 == user1 && room.user1 == room.user2) }
  if chatrooms.length == 0
    Chatroom.create!(user1: user1, user2: user2)
  end
  chatrooms = []
end

puts "finished creating chatrooms"

puts "creating comments"

50.times do
  comment = Comment.new(user: User.all.sample, book: Book.all.sample, content: Faker::Lorem.paragraph(sentence_count: rand(2..4)))
  comment.parent = rand(1..4) == 1 ? nil : Comment.all.sample
  comment.save
end

puts "finished creating comments"

puts "creating messages"

60.times do
  Chatroom.all.each do |room|
    Message.create!(user: rand(1..2) == 1 ? room.user1 : room.user2, chatroom: room, content: Faker::Lorem.paragraph(sentence_count: rand(1..4)))
  end
end

puts "finished creating messages"

puts "Creating requests"

30.times do
  status_arr = ["pending", "declined"]
  ci1 = CatalogItem.all.sample
  ci_arr = CatalogItem.all.filter { |item| item != ci1 }
  ci2 = rand(1..3) == 1 ? nil : ci_arr.sample
  ci2 ? user = ci2.user : user = User.all.sample
  request = Request.new(user: user, status: status_arr.sample)
  request.buyer_item = ci1
  request.seller_item = ci2
  request.save
end

20.times do
  ci1 = CatalogItem.all.sample
  ci_arr = CatalogItem.all.filter { |item| item != ci1 }
  ci2 = ci_arr.sample
  request = Request.new(user: ci2.user, status: "accepted")
  request.buyer_item = ci1
  request.seller_item = ci2
  request.save
end

20.times do
  ci1 = CatalogItem.all.sample
  ci_arr = CatalogItem.all.filter { |item| item != ci1 }
  ci2 = ci_arr.sample
  request = Request.new(user: ci2.user, status: "completed")
  request.buyer_item = ci1
  request.seller_item = ci2
  request.save
end

puts "finished creating requests"

puts "creating user reviews"

50.times do
  user1 = User.all.sample
  if user1.first_name == "Daniel"
    puts "rating that god Daniel"
  else
    puts "rating that piece of shit #{user1.first_name}"
  end
  user_arr = User.all.filter { |user| user != user1 }
  UserReview.create!(content: Faker::Lorem.paragraph(sentence_count: rand(1..4)), rating: rand(1..5), author: user1, receiver: user_arr.sample)
end

puts "finished creating user reviews"










