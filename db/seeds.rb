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

user = User.new(email: 'dg@gmail.com', password: 123456, first_name: "Daniel", address: "400 W 2nd St, Austin, TX 78701")
file_image = URI.open("https://kitt.lewagon.com/placeholder/users/random")
user.photo.attach(io: file_image, filename: "nes.png", content_type: 'image/png')
user.save
puts "created Daniel"
user = User.new(email: 'mm@gmail.com', password: 123456, first_name: "Moshe", address: "2110 E 21st St, Austin, Texas")
file_image = URI.open("https://kitt.lewagon.com/placeholder/users/random")
user.photo.attach(io: file_image, filename: "nes.png", content_type: 'image/png')
user.save
puts "created Moshe"
user = User.new(email: 'hg@gmail.com', password: 123456, first_name: "Hugo", address: "902 Glen Oak Dr, Austin, TX 78745")
file_image = URI.open("https://kitt.lewagon.com/placeholder/users/random")
user.photo.attach(io: file_image, filename: "nes.png", content_type: 'image/png')
user.save
puts "created Hugo"
user = User.new(email: 'sa@gmail.com', password: 123456, first_name: "Shane", address: "2300 Waterloo City Ln, Austin, Texas")
file_image = URI.open("https://kitt.lewagon.com/placeholder/users/random")
user.photo.attach(io: file_image, filename: "nes.png", content_type: 'image/png')
user.save
puts "created Shane"


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

puts "Creatign coffee shop seeds"


coffee_shops = [{"business_id": "sxJG2vDnCMBTRq32GObUXg","name": "Starbucks","address": "516 W Oltorf","city": "Austin","state": "TX","postal_code": "78704","latitude": 30.242174,"longitude": -97.758917},
{"business_id": "DuPYjYBCAdJMKQwnYD6C1w","name": "Starbucks","address": "300 E 4th St","city": "Austin","state": "TX","postal_code": "78701","latitude": 30.265468,"longitude": -97.740448},
{"business_id": "67w0M7LneP7STSN-_c263g","name": "Starbucks","address": "3328 Slaughter Ln","city": "Austin","state": "TX","postal_code": "78748","latitude": 30.182696,"longitude": -97.847085},
{"business_id": "ZAvXG6rCF8xyzyUr4_nf3A","name": "Starbucks","address": "1201 Barbara Jordan Blvd, Ste 1200","city": "Austin","state": "TX","postal_code": "78723","latitude": 30.305812,"longitude": -97.7080072188},
{"business_id": "PQ4vdBi1fBKP3fjyNqCv6w","name": "Starbucks","address": "9617 Anderson Mill Rd, Ste 238","city": "Austin","state": "TX","postal_code": "78750","latitude": 30.448142,"longitude": -97.791346},
{"business_id": "h3CYDlKFUrZaJWbTgxW9IQ","name": "Starbucks","address": "4006 S Lamar Blvd","city": "Austin","state": "TX","postal_code": "78704","latitude": 30.237645,"longitude": -97.79256},
{"business_id": "RhcVws6Mncwubbhi2IYkbg","name": "Starbucks","address": "6301 West Parmer Ln, Ste 401","city": "Austin","state": "TX","postal_code": "78729","latitude": 30.4448696907,"longitude": -97.743637},
{"business_id": "s-OqnpY3vad04l0MIXqNQg","name": "Starbucks","address": "7710 N Fm 620, Unit 610","city": "Austin","state": "TX","postal_code": "78726","latitude": 30.4055468544,"longitude": -97.85128},
{"business_id": "BBzLOGz_7ufzBNlhMjvgIA","name": "Starbucks","address": "3706 Guadalupe St, A","city": "Austin","state": "TX","postal_code": "78705","latitude": 30.302553,"longitude": -97.738459},
{"business_id": "DDynNCGdOOZ3xt70ubWlrQ","name": "Starbucks","address": "7709 E Ben White Blvd, Ste 100","city": "Austin","state": "TX","postal_code": "78744","latitude": 30.217701,"longitude": -97.689925},
{"business_id": "zZmMcfN2Z7O4Q_2X7grodw","name": "Starbucks","address": "907 W 5th St, Ste 102","city": "Austin","state": "TX","postal_code": "78703","latitude": 30.269901,"longitude": -97.753994},
{"business_id": "zJqNsdRHw3T0QKBTTO85AQ","name": "Starbucks","address": "2422 Ranch Rd 620 S","city": "Austin","state": "TX","postal_code": "78738","latitude": 30.3399616751,"longitude": -97.9699718294},
{"business_id": "jxJ4slFeCcKoAgXQn1X5AA","name": "Starbucks","address": "4400 N Lamar, Ste 104","city": "Austin","state": "TX","postal_code": "78756","latitude": 30.3127179009,"longitude": -97.73845},
{"business_id": "zPMLjmXmHXTW9WRh3fVfZA","name": "Starbucks Reserve","address": "3120 Palm Way, Ste 110","city": "Austin","state": "TX","postal_code": "78758","latitude": 30.403366,"longitude": -97.72231},
{"business_id": "2OWVJAoPHQucVOWxP-FbUw","name": "Starbucks","address": "110 E Second St","city": "Austin","state": "TX","postal_code": "78701","latitude": 30.264522,"longitude": -97.74347},
{"business_id": "FuCx_MkgCkwpsAs8wXt-Qw","name": "Starbucks","address": "7015 West US Hwy 290","city": "Austin","state": "TX","postal_code": "78736","latitude": 30.232506,"longitude": -97.8740457},
{"business_id": "nQh2dwvcBYpsLX5qBXWb5w","name": "Starbucks","address": "208 Barton Springs Rd","city": "Austin","state": "TX","postal_code": "78704","latitude": 30.260671,"longitude": -97.746936},
{"business_id": "VQtIDa3z8TxJIry33sxLug","name": "Starbucks","address": "1920 East Riverside Dr, Bldg E, Unit 100","city": "Austin","state": "TX","postal_code": "78741","latitude": 30.2424,"longitude": -97.72753},
{"business_id": "3gYJoiZ9M7BIWbKaWSyJlA","name": "Starbucks","address": "9600 Escarpment Blvd, Ste 700","city": "Austin","state": "TX","postal_code": "78749","latitude": 30.202654,"longitude": -97.878781},
{"business_id": "GHsp24U3apASU_GlNMI6Zw","name": "Starbucks","address": "3600 Presidential Blvd","city": "Austin","state": "TX","postal_code": "78719","latitude": 30.202185,"longitude": -97.665083},
{"business_id": "yw5Vzs-t1lA696eKkP16tQ","name": "Starbucks","address": "6816 Westgate Blvd","city": "Austin","state": "TX","postal_code": "78745","latitude": 30.2079386,"longitude": -97.815373},
{"business_id": "osIJajg3nlSR-xhMDyXwZw","name": "Starbucks","address": "500A East Ben White Blvd","city": "Austin","state": "TX","postal_code": "78704","latitude": 30.220458,"longitude": -97.757391},
{"business_id": "PcLagfMcNNA0VwCJ6szlDQ","name": "Starbucks","address": "2505 Parmer Ln","city": "Austin","state": "TX","postal_code": "78727","latitude": 30.418825,"longitude": -97.70268},
{"business_id": "Xu4V3fk8YeBLgMk6JJCQdw","name": "Starbucks","address": "701 South Capitol Of Texas Hwy, B-200","city": "Austin","state": "TX","postal_code": "78746","latitude": 30.292598,"longitude": -97.825278},
{"business_id": "OKPtcundSL2TGtaX4ne8HQ","name": "Starbucks","address": "5145 N Fm 620","city": "Austin","state": "TX","postal_code": "75783","latitude": 30.389149,"longitude": -97.883809},
{"business_id": "AERUqZrK0v0I0rgf91Csjg","name": "Starbucks","address": "301 West 3rd St","city": "Austin","state": "TX","postal_code": "78701","latitude": 30.265863,"longitude": -97.746492},
{"business_id": "0jlyrJD6QAw3mtDuqSw5Jw","name": "Starbucks","address": "2901 S Capital Of Texas Hwy, Space E01, Barton Creek Mall","city": "Austin","state": "TX","postal_code": "78746","latitude": 30.257422,"longitude": -97.80739},
{"business_id": "iI8dOFNg8lSD7_h6fB1Q1g","name": "Starbucks","address": "6600 S Mopac Expy, Ste 2100","city": "Austin","state": "TX","postal_code": "78749","latitude": 30.222167,"longitude": -97.837253},
{"business_id": "-M_2-RVQ0JifZO13sjS4QQ","name": "Starbucks","address": "1801 E 51st St, Ste 190","city": "Austin","state": "TX","postal_code": "78723","latitude": 30.301643,"longitude": -97.69988},
{"business_id": "1kBzlu-sFabunenL1DVUbw","name": "Starbucks","address": "501 West 15th St","city": "Austin","state": "TX","postal_code": "78701","latitude": 30.278079,"longitude": -97.744345},
{"business_id": "A3gVE_TtGC8swcBYE3rCfg","name": "Starbucks","address": "24th & Guadalupe","city": "Austin","state": "TX","postal_code": "78713","latitude": 30.287209,"longitude": -97.741109},
{"business_id": "sgLmoM63aKky_R_TKq5diA","name": "Starbucks","address": "11410 Mopac Expy","city": "Austin","state": "TX","postal_code": "78759","latitude": 30.401927,"longitude": -97.726336},
{"business_id": "Smn-qPRbnanM_I8gspb_Sw","name": "Starbucks","address": "2300 S IH-35 S","city": "Austin","state": "TX","postal_code": "78704","latitude": 30.2336763,"longitude": -97.742344},
{"business_id": "nsFRv1wiTB-RoGZ_5LhgEQ","name": "Starbucks","address": "1200 Barton Springs Rd","city": "Austin","state": "TX","postal_code": "78704","latitude": 30.26116538,"longitude": -97.75792536},
{"business_id": "ng7bicJ-ocJiwxbd9lZJhQ","name": "Starbucks","address": "8040 Mesa Dr","city": "Austin","state": "TX","postal_code": "78731","latitude": 30.371352,"longitude": -97.758351},
{"business_id": "45HscRdEF-tp12UyFJn0DA","name": "Starbucks","address": "3317 Northland Dr, Ste A","city": "Austin","state": "TX","postal_code": "78731","latitude": 30.3369803,"longitude": -97.7570557},
{"business_id": "t2lU21gYQ24k2iANuGpnuA","name": "Starbucks","address": "111 E Cesar Chavez St","city": "Austin","state": "TX","postal_code": "78701","latitude": 30.262789,"longitude": -97.743965},
{"business_id": "gwuW5U9uzoC95qODgoB3nA","name": "Starbucks","address": "2401 Cardinal Lp","city": "Austin","state": "TX","postal_code": "78617","latitude": 30.213259,"longitude": -97.65819},
{"business_id": "p18rvKx5-Nw2TOPPEJ25sQ","name": "Starbucks","address": "1509 South Lamar Blvd, Ste 100","city": "Austin","state": "TX","postal_code": "78704","latitude": 30.252263,"longitude": -97.763602},
{"business_id": "IBgJ1q6lh8u_ootx10nHmw","name": "Starbucks","address": "1001 Congress Ave, Ste 180","city": "Austin","state": "TX","postal_code": "78701","latitude": 30.271906,"longitude": -97.741161},
{"business_id": "fT1JUBJGlF3Qv2HXgrhC3g","name": "Starbucks","address": "1606 E Parmer Ln, Ste 100","city": "Austin","state": "TX","postal_code": "78753","latitude": 30.3885818975,"longitude": -97.650148589},
{"business_id": "AA1Wwu4LbVpd-FtVeyC-ZA","name": "Starbucks","address": "2727 Exposition Blvd, Unit  126","city": "Austin","state": "TX","postal_code": "78703","latitude": 30.304671,"longitude": -97.76447},
{"business_id": "y29qaSu61-pbXQY0IRP7Nw","name": "Starbucks","address": "10107 Research Blvd","city": "Austin","state": "TX","postal_code": "78759","latitude": 30.3931069891,"longitude": -97.74431},
{"business_id": "GUpO-tDdbmRJmEvuyZ_5Fg","name": "Starbucks","address": "9722 Great Hills Trl, Ste 380","city": "Austin","state": "TX","postal_code": "78759","latitude": 30.394866,"longitude": -97.752499},
{"business_id": "_-YtxRvghRMlEHG3KU2s1w","name": "Starbucks","address": "10900 Research Blvd","city": "Austin","state": "TX","postal_code": "78759","latitude": 30.401952,"longitude": -97.746882},
{"business_id": "3NFpMYEfMYw5BNczR7_qlA","name": "Starbucks","address": "2900 West Anderson Ln","city": "Austin","state": "TX","postal_code": "78757","latitude": 30.3598112288,"longitude": -97.737927},
{"business_id": "tHXsMZKjQtudKP87PGQ-Ug","name": "Starbucks","address": "2711 W Braker Ln","city": "Austin","state": "TX","postal_code": "78758","latitude": 30.3908889063,"longitude": -97.7223035503},
{"business_id": "I5ksg_UYSqH6sUDY6Cf1JA","name": "Starbucks","address": "3300 Bee Cave Rd, Ste 250","city": "Austin","state": "TX","postal_code": "78746","latitude": 30.275908,"longitude": -97.80007},
{"business_id": "F0YYSqYmVUDKg1hbtanAow","name": "Starbucks","address": "2101 Speedway","city": "Austin","state": "TX","postal_code": "78712","latitude": 30.2847716,"longitude": -97.736342},
{"business_id": "adGp9qR8ahVVrOuWj3B7Ig","name": "Starbucks","address": "1700 W Parmer Ln","city": "Austin","state": "TX","postal_code": "78727","latitude": 30.413262,"longitude": -97.688223},
{"business_id": "A3LlVFqVXW4-BQaEg_dMYA","name": "Starbucks","address": "555 East 5th St","city": "Austin","state": "TX","postal_code": "78701","latitude": 30.265242,"longitude": -97.738232},
{"business_id": "XzQaLaSwS_ae1EAmTQ0aWA","name": "Starbucks","address": "504 W 24th St, Ste B","city": "Austin","state": "TX","postal_code": "78705","latitude": 30.287883,"longitude": -97.74257},
{"business_id": "_Dl1YmHct9J0Nn7KsbTW_w","name": "Starbucks","address": "1422 Town Creek Dr","city": "Austin","state": "TX","postal_code": "78741","latitude": 30.2424052705,"longitude": -97.7275542209},
{"business_id": "fwJuUYkUlOwHe6n4loRo3w","name": "Starbucks","address": "600 Congress Ave, Ste G-270","city": "Austin","state": "TX","postal_code": "78701","latitude": 30.268259,"longitude": -97.742962144},
{"business_id": "mFubp5U-F1eFnYK7mzLDwA","name": "Starbucks","address": "3637 Far West Blvd","city": "Austin","state": "TX","postal_code": "78731","latitude": 30.354667,"longitude": -97.756315},
{"business_id": "CV4ssWHaKQ3Rid8u3ajuCw","name": "Starbucks","address": "9300 S I-35 Service Rd S Bound, G100","city": "Austin","state": "TX","postal_code": "78748","latitude": 30.165573,"longitude": -97.788109}]

coffee_shops.each do |shop|
  Coffee.create!(name: "Starbucks", latitude: shop[:latitude], longitude: shop[:longitude] )
end

puts "finished coffee shop seeds"
