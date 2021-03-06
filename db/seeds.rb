# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

projectDir = Rails.root.join('app','res').to_s
#####RESET DATABASE DATA
Company.destroy_all
Forum.destroy_all
User.destroy_all
UserCompany.destroy_all
Message.destroy_all
Ride.destroy_all

#########
### COMPANY DATA
Company.create(name: "Uber")
Company.create(name: "Lyft")

#########
### FORUM

Forum.create(topic: "Newbs", tags: ["Uber for life", "NYC", "driving"])
Forum.create(topic: "LyftLyfe", tags: ["Lyft for life", "NYC", "driving"])
Forum.create(topic: "NYC Drivers", tags: ["Uber for life", "NYC", "driving"])
Forum.create(topic: "Bk ", tags: ["Uber for life", "NYC", "driving"])

#########
### USER DATA
User.create(name: 'Guest',username:'guest', car:"Infiniti Q50s", rating:"4.8",experience:5, location:"NYC",password_digest: BCrypt::Password.create('1234') )
User.create(name: 'Jordan',username:'Jordan', car:"Jeep", rating:"4.8",experience:5, location:"NYC", password_digest: BCrypt::Password.create('1234') )

User.create(name: 'Zev',username:'Zev', car:"Porsche", rating:"4.5", experience:2, location:"NYC", password_digest: BCrypt::Password.create('1234'))

User.create(username: "Zach", password_digest: BCrypt::Password.create('1234'), name: "Zach", car:"Boston DuckBoat", rating:"3.6", experience:5, location:"Boston")
User.create(username: "Evans",   password_digest: BCrypt::Password.create('1234'), name: "Evans", car:"HUMVEE", rating:"2.4", experience:10, location:"NYC")
User.create(username: "MChang", password_digest: BCrypt::Password.create('1234'), name: "Mike Chang", car:"Prius", rating:"4.5", experience:100, location:"Japan")

User.create(username: "Melissa",   password_digest: BCrypt::Password.create('1234'), name: "Melissa", car:"Mini Cooper", rating:"4.6", experience:8, location:"Boston")
User.create(username: "Brandon",   password_digest: BCrypt::Password.create('1234'), name: "Brandon", car:"T-Rex", rating:"3.8", experience:3, location:"NYC")
User.create(username: "Humzah",   password_digest: BCrypt::Password.create('1234'), name: "Humzah", car:"Civic Sport", rating:"3.5", experience:2, location:"Oklahoma City")

User.all.each_with_index { |u,idx|
  # byebug
  u.profile_pic.attach(io: File.open(projectDir+"/driver#{1+idx}.jpg"), filename: "driver#{1+idx}.jpg", content_type: "image/jpg")
}

#########
### USERCOMPANY JOIN DATA
UserCompany.create(user_id: User.find_by(name: "Jordan").id, company_id: Company.find_by(name: "Uber").id)
UserCompany.create(user_id: User.find_by(name: "Guest").id, company_id: Company.find_by(name: "Uber").id)
UserCompany.create(user_id: User.find_by(name: "Guest").id, company_id: Company.find_by(name: "Lyft").id)
UserCompany.create(user_id: User.find_by(name: "Zev").id, company_id: Company.find_by(name: "Lyft").id)

#########
### MESSAGE DATA
Message.create(user_id: User.find_by(name: "Jordan").id, forum_id: Forum.find_by(topic: "Newbs").id, content: "This is a message!")
Message.create(user_id: User.find_by(name: "Zev").id, forum_id: Forum.find_by(topic: "Newbs").id, content: "This is another message!")

#########
### RIDE DATA
Ride.create(user_id: User.find_by(name: "Jordan").id, company_id: Company.find_by(name: "Uber").id, distance: 2, price: 22, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "NYC", end_location: "Brooklyn")
Ride.create(user_id: User.find_by(name: "Jordan").id, company_id: Company.find_by(name: "Uber").id, distance: 200, price: 28, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "LI", end_location: "Hamptons")
Ride.create(user_id: User.find_by(name: "Jordan").id, company_id: Company.find_by(name: "Lyft").id, distance: 20, price: 42, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "Queens", end_location: "Bronx")
Ride.create(user_id: User.find_by(name: "Guest").id, company_id: Company.find_by(name: "Uber").id, distance: 2, price: 12, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "Queens", end_location: "Brooklyn")
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

Ride.create(user_id: User.find_by(name: "Humzah").id, company_id: Company.find_by(name: "Uber").id, distance: 2, price: 15, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "Georgia", end_location: "Florida")
Ride.create(user_id: User.find_by(name: "Humzah").id, company_id: Company.find_by(name: "Uber").id, distance: 200, price: 100, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "Canada", end_location: "Hamptons")
Ride.create(user_id: User.find_by(name: "Humzah").id, company_id: Company.find_by(name: "Lyft").id, distance: 20, price: 100, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "Hamptons", end_location: "NYC")
Ride.create(user_id: User.find_by(name: "Zach").id, company_id: Company.find_by(name: "Uber").id, distance: 2, price: 12, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "NYC", end_location: "Brooklyn")
Ride.create(user_id: User.find_by(name: "Humzah").id, company_id: Company.find_by(name: "Uber").id, distance: 2, price: 209, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "Oklahoma", end_location: "Brooklyn")



Ride.create(user_id: User.find_by(name: "Evans").id, company_id: Company.find_by(name: "Uber").id, distance: 2, price: 39, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "NYC", end_location: "Brooklyn")
Ride.create(user_id: User.find_by(name: "Evans").id, company_id: Company.find_by(name: "Uber").id, distance: 200, price: 29, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "LI", end_location: "Hamptons")
Ride.create(user_id: User.find_by(name: "Zach").id, company_id: Company.find_by(name: "Lyft").id, distance: 20, price: 59, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "Queens", end_location: "Bronx")
Ride.create(user_id: User.find_by(name: "Guest").id, company_id: Company.find_by(name: "Uber").id, distance: 2, price: 44, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "NYC", end_location: "Brooklyn")
Ride.create(user_id: User.find_by(name: "Jordan").id, company_id: Company.find_by(name: "Uber").id, distance: 2, price: 12, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "NYC", end_location: "Brooklyn")

Ride.create(user_id: User.find_by(name: "Zev").id, company_id: Company.find_by(name: "Uber").id, distance: 2, price: 123, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "NYC", end_location: "Brooklyn")
Ride.create(user_id: User.find_by(name: "Mike Chang").id, company_id: Company.find_by(name: "Uber").id, distance: 200, price: 60, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "LI", end_location: "Hamptons")
Ride.create(user_id: User.find_by(name: "Mike Chang").id, company_id: Company.find_by(name: "Lyft").id, distance: 20, price: 60, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "Hamptons", end_location: "Bronx")
Ride.create(user_id: User.find_by(name: "Mike Chang").id, company_id: Company.find_by(name: "Uber").id, distance: 2, price: 20, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "Queens", end_location: "Brooklyn")
Ride.create(user_id: User.find_by(name: "Mike Chang").id, company_id: Company.find_by(name: "Uber").id, distance: 2, price: 40, started_at: DateTime.now, end_at: DateTime.now+1, start_location: "Brooklyn", end_location: "Queens")


#########
### FOLLOWING/FOLLOWER FRIENDSHIP DATA
users = User.all
user  = users.find_by(name:"Guest")
following = users[2..8]
followers = users[3..7]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

# Friendship.create(followed_id: User.find_by(name: "Guest").id, follower_id: User.find_by(name: "Mike Chang").id)
# Friendship.create(followed_id: User.find_by(name: "Guest").id, follower_id: User.find_by(name: "Jordan").id)
# Friendship.create(followed_id: User.find_by(name: "Zev").id, follower_id: User.find_by(name: "Mike Chang").id)
# Friendship.create(followed_id: User.find_by(name: "Jordan").id, follower_id: User.find_by(name: "Mike Chang").id)
# Friendship.create(followed_id: User.find_by(name: "Guest").id, follower_id: User.find_by(name: "Evans").id)
# Friendship.create(followed_id: User.find_by(name: "Humzah").id, follower_id: User.find_by(name: "Mike Chang").id)
# Friendship.create(followed_id: User.find_by(name: "Humzah").id, follower_id: User.find_by(name: "Evans").id)
# Friendship.create(followed_id: User.find_by(name: "Zev").id, follower_id: User.find_by(name: "Jordan").id)
# Friendship.create(followed_id: User.find_by(name: "Zev").id, follower_id: User.find_by(name: "Melissa").id)
# Friendship.create(followed_id: User.find_by(name: "Guest").id, follower_id: User.find_by(name: "Brandon").id)
# Friendship.create(followed_id: User.find_by(name: "Mike Chang").id, follower_id: User.find_by(name: "Melissa").id)
# Friendship.create(followed_id: User.find_by(name: "Mike Chang").id, follower_id: User.find_by(name: "Zev").id)
# Friendship.create(followed_id: User.find_by(name: "Mike Chang").id, follower_id: User.find_by(name: "Evans").id)
# Friendship.create(followed_id: User.find_by(name: "Evans").id, follower_id: User.find_by(name: "Melissa").id)
# Friendship.create(followed_id: User.find_by(name: "Jordan").id, follower_id: User.find_by(name: "Brandon").id)
# Friendship.create(followed_id: User.find_by(name: "Humzah").id, follower_id: User.find_by(name: "Brandon").id)
# Friendship.create(followed_id: User.find_by(name: "Humzah").id, follower_id: User.find_by(name: "Zev").id)
