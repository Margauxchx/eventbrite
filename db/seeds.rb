require 'faker'

User.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')
Event.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('events')
Attendance.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('attendances')


3.times do 
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Quotes::Shakespeare.hamlet_quote,
    email: ["margaux@yopmail.com","chaix@yopmail.com","fra@yopmail.com","gilo@yopmail.com","caro@yopmail.com"].sample,
    encrypted_password: '123456')
end
  
3.times do
  event = Event.create!(
    start_date: Faker::Date.forward(days: 23),
    duration: rand(60..360),
    title: Faker::Movies::Hobbit.quote,
    description: Faker::Lorem.sentence,
    price: rand(1..1000),
    location: Faker::Address.city, 
    user_id: User.all.sample.id)
end
  
3.times do
  attendance = Attendance.create!(
    stripe_customer_id: Faker::Code.nric,
    user_id: User.all.sample.id,
    event_id: Event.all.sample.id)
end
  
  puts "C'est fait"