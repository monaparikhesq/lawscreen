class Tag < ActiveRecord::Base
  attr_accessible :name

   has_many :tagging
   has_many :screencast
   has_many :user
end
