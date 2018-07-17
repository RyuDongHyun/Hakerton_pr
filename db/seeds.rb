# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'
file = File.read('test3.csv')
users = CSV.parse(file, headers: true)

users.each do |user|
    User.create(
        email: user[0],
        password: user[1],
        password_confirmation: user[2]
        )
end

User.create(
    email: "admin@admin.com",
    password: "12341234",
    password_confirmation: "12341234",
    is_admin?: true
    )
