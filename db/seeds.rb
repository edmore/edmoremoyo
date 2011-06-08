# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
def add_profile_data
  if Profile.first
    puts "Data already initialized"
  else
    profile = Profile.new
    profile.summary = "Place Summary here..."
    profile.skills = "Place Summary here..."
    profile.education = "Place Summary here..."
    profile.experience = "Place Summary here..."
    profile.save
  end
end

puts 'Seeding from seeds.rb...'
add_profile_data
puts "Seeding Complete!!"
