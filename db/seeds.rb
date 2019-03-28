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

User.create(name: "Zach", car:"Boston DuckBoat", rating:"3.6", experience:5, location:"Boston")
User.create(name: "Evans", car:"HUMVEE", rating:"2.4", experience:10, location:"NYC")
User.create(name: "Mike Chang", car:"Prius", rating:"4.5", experience:100, location:"Japan")

User.create(name: "Melissa", car:"Mini Cooper", rating:"4.6", experience:8, location:"Boston")
User.create(name: "Brandon", car:"T-Rex", rating:"3.8", experience:3, location:"NYC")
User.create(name: "Humzah", car:"Civic Sport", rating:"3.5", experience:2, location:"Oklahoma City")


UserCompany.create(user_id: User.find_by(name: "Jordan").id, company_id: Company.find_by(name: "Uber").id)
UserCompany.create(user_id: User.find_by(name: "Brian").id, company_id: Company.find_by(name: "Uber").id)
UserCompany.create(user_id: User.find_by(name: "Brian").id, company_id: Company.find_by(name: "Lyft").id)
UserCompany.create(user_id: User.find_by(name: "Zev").id, company_id: Company.find_by(name: "Lyft").id)

Message.create(user_id: User.find_by(name: "Jordan").id, forum_id: Forum.find_by(topic: "Newbs").id, content: "This is a message!")
Message.create(user_id: User.find_by(name: "Zev").id, forum_id: Forum.find_by(topic: "Newbs").id, content: "This is another message!")

Ride.create(user_id: User.find_by(name: "Jordan").id, company_id: Company.find_by(name: "Uber").id, distance: 2, price: 22, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "NYC", end_location: "Brooklyn")
Ride.create(user_id: User.find_by(name: "Jordan").id, company_id: Company.find_by(name: "Uber").id, distance: 200, price: 28, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "LI", end_location: "Hamptons")
Ride.create(user_id: User.find_by(name: "Jordan").id, company_id: Company.find_by(name: "Lyft").id, distance: 20, price: 42, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "Queens", end_location: "Bronx")
Ride.create(user_id: User.find_by(name: "Brian").id, company_id: Company.find_by(name: "Uber").id, distance: 2, price: 12, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "Queens", end_location: "Brooklyn")
Ride.create(user_id: User.find_by(name: "Zev").id, company_id: Company.find_by(name: "Uber").id, distance: 2, price: 18, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "LI", end_location: "Brooklyn")


Ride.create(user_id: User.find_by(name: "Humzah").id, company_id: Company.find_by(name: "Uber").id, distance: 2, price: 15, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "LI", end_location: "Brooklyn")
Ride.create(user_id: User.find_by(name: "Zach").id, company_id: Company.find_by(name: "Uber").id, distance: 200, price: 18, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "LI", end_location: "Hamptons")
Ride.create(user_id: User.find_by(name: "Zach").id, company_id: Company.find_by(name: "Lyft").id, distance: 20, price: 101, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "Hamptons", end_location: "NYC")
Ride.create(user_id: User.find_by(name: "Zach").id, company_id: Company.find_by(name: "Uber").id, distance: 2, price: 42, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "NYC", end_location: "Brooklyn")
Ride.create(user_id: User.find_by(name: "Evans").id, company_id: Company.find_by(name: "Uber").id, distance: 2, price: 29, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "NYC", end_location: "Brooklyn")

Ride.create(user_id: User.find_by(name: "Evans").id, company_id: Company.find_by(name: "Uber").id, distance: 2, price: 35, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "NYC", end_location: "Brooklyn")
Ride.create(user_id: User.find_by(name: "Mike Chang").id, company_id: Company.find_by(name: "Uber").id, distance: 200, price: 24, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "LI", end_location: "Hamptons")
Ride.create(user_id: User.find_by(name: "Mike Chang").id, company_id: Company.find_by(name: "Lyft").id, distance: 20, price: 32, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "Queens", end_location: "Bronx")
Ride.create(user_id: User.find_by(name: "Mike Chang").id, company_id: Company.find_by(name: "Uber").id, distance: 2, price: 12, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "NYC", end_location: "Brooklyn")
Ride.create(user_id: User.find_by(name: "Mike Chang").id, company_id: Company.find_by(name: "Uber").id, distance: 2, price: 9, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "NYC", end_location: "Brooklyn")


Ride.create(user_id: User.find_by(name: "Evans").id, company_id: Company.find_by(name: "Uber").id, distance: 2, price: 39, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "NYC", end_location: "Brooklyn")
Ride.create(user_id: User.find_by(name: "Evans").id, company_id: Company.find_by(name: "Uber").id, distance: 200, price: 29, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "LI", end_location: "Hamptons")
Ride.create(user_id: User.find_by(name: "Zach").id, company_id: Company.find_by(name: "Lyft").id, distance: 20, price: 59, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "Queens", end_location: "Bronx")
Ride.create(user_id: User.find_by(name: "Brian").id, company_id: Company.find_by(name: "Uber").id, distance: 2, price: 44, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "NYC", end_location: "Brooklyn")
Ride.create(user_id: User.find_by(name: "Jordan").id, company_id: Company.find_by(name: "Uber").id, distance: 2, price: 12, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "NYC", end_location: "Brooklyn")

Ride.create(user_id: User.find_by(name: "Zev").id, company_id: Company.find_by(name: "Uber").id, distance: 2, price: 123, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "NYC", end_location: "Brooklyn")
Ride.create(user_id: User.find_by(name: "Mike Chang").id, company_id: Company.find_by(name: "Uber").id, distance: 200, price: 60, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "LI", end_location: "Hamptons")
Ride.create(user_id: User.find_by(name: "Mike Chang").id, company_id: Company.find_by(name: "Lyft").id, distance: 20, price: 60, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "Hamptons", end_location: "Bronx")
Ride.create(user_id: User.find_by(name: "Mike Chang").id, company_id: Company.find_by(name: "Uber").id, distance: 2, price: 20, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "Queens", end_location: "Brooklyn")
Ride.create(user_id: User.find_by(name: "Mike Chang").id, company_id: Company.find_by(name: "Uber").id, distance: 2, price: 40, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "Brooklyn", end_location: "Queens")

Friendship.create(followee_id: 1, follower_id: 2)
Friendship.create(followee_id: 1, follower_id: 3)
Friendship.create(followee_id: 2, follower_id: 1)
Friendship.create(followee_id: 2, follower_id: 3)
Friendship.create(followee_id: 3, follower_id: 1)
Friendship.create(followee_id: 3, follower_id: 2)

Friendship.create(followee_id: 5, follower_id: 2)
Friendship.create(followee_id: 5, follower_id: 5)
Friendship.create(followee_id: 2, follower_id: 3)
Friendship.create(followee_id: 2, follower_id: 3)
Friendship.create(followee_id: 7, follower_id: 1)
Friendship.create(followee_id: 3, follower_id: 1)
