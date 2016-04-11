class School < ActiveRecord::Base
  has_many :users
  has_many :sections
  has_many :students
end
