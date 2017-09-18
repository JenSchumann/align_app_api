# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "one", password: "one", grade: 1, interests: "being number 1", strengths: "narcissism", aspirations: "being one with myself")
  # , date: 2017-09-17, created_at: 2017-09-17 20:44:47.754791, updated_at: 2017-09-17 20:44:47.754791)

User.create(username: "two", password: "two", grade: 2, interests: "two turtledoves", strengths: "singing duets", aspirations: "having 2 careers at same time")
# , date: 2017-09-02 , created_at: 2017-09-17 21:54:35.492996, updated_at: 2017-09-17 21:54:35.492996)
#
User.create(username: "three", password: "three", grade: 3, interests: "watch 3 musketeers", strengths: "lift 3 pounds", aspirations: "have 3 islands")
# , date: 2017-09-08, created_at: 2017-09-17 21:54:32.145917, updated_at: 2017-09-17 21:54:32.145917)
#
User.create(username: "four", password: "four", grade: 4, interests: "4 weddings & a funeral", strengths: "hiking the 4 corners", aspirations: "having four race cars")
# , date: 2008-08-08, created_at: 2017-09-17 21:54:32.524911, updated_at: 2017-09-17 21:54:32.524911)
#
User.create(username: "five", password: "five", grade: 5, interests: "giving high fives", strengths: "multiplying by fives", aspirations: "have five million")
# , date: 2004-04-04, created_at: 2017-09-17 21:54:32.82736, updated_at: 2017-09-17 21:54:32.82736)
#
User.create(username: "six", password: "six", grade: 6, interests: "researching atheism", strengths: "questioning everything", aspirations: "being a philosopher")
# , date: 2001-01-30, created_at: 2017-09-17 21:54:35.2033, updated_at: 2017-09-17 21:54:35.2033)
