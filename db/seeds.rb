# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = [{:username => 'ddhuri', :password => 'ddhuri', :emailID => 'ddhuri@binghamton.edu'},
{ :username => 'purva13', :password => 'purva13', :emailID => 'purva13@binghamton.edu'}]

users.each do |user|
    User.create!(user)
end