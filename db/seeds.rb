# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
#

if Rails.env.development? && Admin.count.zero?
  Admin.create!(:name => 'Candy Man', :email => 'contact@clevercode.net', :password => 'password', :password_confirmation => 'password')
end
