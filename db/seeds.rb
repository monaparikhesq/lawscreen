# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Tag.destroy_all
Screencast.destroy_all
Tagging.destroy_all
Note.destroy_all

puts "Creating users."
100.times do |i|
  User.create(:email => "user#{i}@gmail.com", :first_name => "First#{i}", :last_name => "Last#{i}")
end

puts "Creating tags."
tags = ["billing", "document_saving", "calendaring"]
tags.each do |tag|
  Tag.create :name => tag
end

puts "Creating screencasts."
100.times do |i|
  Screencast.create(:title => "Screencast #{i}", :description => "Lorem Ipsum #{i}", :length => rand(360), :embed => "http://www.youtube.com/watch?v=sdyC1BrQd6g")
end

# Tagging(id: integer, screencast_id: integer, tag_id: integer, created_at: datetime, updated_at: datetime) 

puts "Creating taggings."
Screencast.all.each do |screencast|
  Tag.all.sample(2).each do |tag|
    Tagging.create :screencast_id => screencast.id, :tag_id => tag.id
  end
  
# puts "Creating notes."
# 100.times do |i|
#   Note.create(:body => "Lorem Ipsum#{i}")
# end

end

# puts "Creating ratings."
# end
# 
# puts "Creating subscriptions."
# end




