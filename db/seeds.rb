# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Company.destroy_all
Forum.destroy_all
User.destroy_all
UserCompany.destroy_all
Message.destroy_all
Ride.destroy_all

Company.create(name: "Uber")
Company.create(name: "Lyft")

Forum.create(topic: "Newbs", tags: ["Uber for life", "NYC", "driving"])

User.create(name: "Jordan", car:"Jeep", rating:"4.8", experience:5, location:"NYC")
User.create(name: "Zev", car:"Porsche", rating:"4.5", experience:2, location:"NYC")
User.create(name: "Brian", car:"Tesla", rating:"4.9", experience:5, location:"NYC")

UserCompany.create(user_id: User.find_by(name: "Jordan").id, company_id: Company.find_by(name: "Uber").id)
UserCompany.create(user_id: User.find_by(name: "Brian").id, company_id: Company.find_by(name: "Uber").id)
UserCompany.create(user_id: User.find_by(name: "Brian").id, company_id: Company.find_by(name: "Lyft").id)
UserCompany.create(user_id: User.find_by(name: "Zev").id, company_id: Company.find_by(name: "Lyft").id)

Message.create(user_id: User.find_by(name: "Jordan").id, forum_id: Forum.find_by(topic: "Newbs").id, content: "This is a message!")
Message.create(user_id: User.find_by(name: "Zev").id, forum_id: Forum.find_by(topic: "Newbs").id, content: "This is another message!")

Ride.create(user_id: User.find_by(name: "Jordan").id, company_id: Company.find_by(name: "Uber").id, distance: 2, price: 15, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "NYC", end_location: "Brooklyn")
Ride.create(user_id: User.find_by(name: "Jordan").id, company_id: Company.find_by(name: "Uber").id, distance: 200, price: 20, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "LI", end_location: "Hamptons")
Ride.create(user_id: User.find_by(name: "Jordan").id, company_id: Company.find_by(name: "Lyft").id, distance: 20, price: 40, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "Queens", end_location: "Bronx")
Ride.create(user_id: User.find_by(name: "Brian").id, company_id: Company.find_by(name: "Uber").id, distance: 2, price: 15, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "NYC", end_location: "Brooklyn")
Ride.create(user_id: User.find_by(name: "Zev").id, company_id: Company.find_by(name: "Uber").id, distance: 2, price: 15, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "NYC", end_location: "Brooklyn")
