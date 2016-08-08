# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# menu = Menu.first
# user = User.create(first_name: "user5",last_name:"user5",email:"user@user.com",password:"pass")
# Comenzi.create(user: user, meniu: menu)
user = User.new
user.email = "test@test.com"
user.password = "12345"
user.role = user.set_admin_role
user.save