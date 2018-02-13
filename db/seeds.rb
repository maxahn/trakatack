# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
bruce = User.create({first_name: "Bruce", email: "brucewayne@wayneenterprises.com", daily_hours: 8, password: "batmanforever", });
spongebob = User.create({first_name: "Spongebob", email: "s.squarepants@bikinibottom.com", daily_hours: 12, password: "krabbypatties", });
garfield = User.create({first_name: "Garfield", email: "garfield@fatcat.com", daily_hours: 1, password: "lasagna", });
