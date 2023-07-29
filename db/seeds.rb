# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.new(email: 'skywalker@email.com', password: 'anakin66', name: 'anakin')
user.skip_confirmation!
user.save!

board = Board.create!(title: "Friday mood", public: true)
board.board_memberships.create!(user: user, owner: true, write_access: true)
