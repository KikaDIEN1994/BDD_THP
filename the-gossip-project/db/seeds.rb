require 'faker'

User.destroy_all
City.destroy_all
Gossip.destroy_all
Tag.destroy_all
TagGossip.destroy_all
PrivateMessage.destroy_all

cities = []
10.times do
	cities << City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
end

users = []
10.times do |i|
	users << User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.sentence, email: Faker::Internet.email, age: rand(16..64), city: cities[i])
end

gossips = []
2.times do
	10.times do |i|
		gossips << Gossip.create(title: Faker::Book.title, content: Faker::Lorem.sentence, user: users[i])
	end
end

tags = []
10.times do |i|
	tags << Tag.create(title: Faker::Book.title)
end

10.times do |i|
	TagGossip.create(gossip: gossips[i], tag: tags[i])
end

for num in 10..19
	TagGossip.create(gossip: gossips[num], tag: tags[num-10])
end

PrivateMessage.create(sender: User.first, receiver: User.last, content: Faker::Lorem.sentence)
PrivateMessage.create(sender: User.last, receiver: User.first, content: Faker::Lorem.sentence)
PrivateMessage.create(sender: User.all.sample, receiver: User.all.sample, content: Faker::Lorem.sentence)