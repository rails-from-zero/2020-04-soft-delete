# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(name: "John")
user2 = User.create!(name: "Steve")
user3 = User.create!(name: "Jill")
user4 = User.create!(name: "Matt")
user5 = User.create!(name: "Susan")
user6 = User.create!(name: "Daniel")

post1 = Post.create!(
  title: "Let's introduce ourselves!",
  content: "I'll go first. My name is #{user1.name} and I own a '92 gs 500e. What about you guys?",
  user: user1,
  created_at: 1.year.ago
)

Comment.create!(
  content: "I started on the same bike #{user1.name}, But I now ride a 2007 sv650S!",
  user: user5,
  post: post1
)

Comment.create!(
  content: "Awesome stuff guys. I'm the proud owner of a 2005 Harley Sportster.",
  post: post1,
  user: user4
)

Post.create!(
  title: "Thoughts on new speed limits?",
  content: "Lorem ipsum dolor sit",
  user: user2,
  created_at: 1.week.ago
)

Post.create!(
  title: "Spring Trackdays",
  content: "Lorem ipsum dolor sit",
  user: user3,
  created_at: 1.month.ago
)

Post.create!(
  title: "My awesome trip through Europe",
  content: "Lorem ipsum dolor sit",
  user: user5,
  created_at: 1.year.ago
)
