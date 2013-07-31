# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.create(username: "user1", password: "password")
u2 = User.create(username: "user2", password: "password")

g1 = Gist.create(title: "gist1", user_id: 1)
g2 = Gist.create(title: "gist2", user_id: 1)
g3 = Gist.create(title: "gist3", user_id: 2)

f1 = Favorite.create(user_id: 1, gist_id: 2)
f2 = Favorite.create(user_id: 1, gist_id: 3)