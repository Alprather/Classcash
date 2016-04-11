class Student < ActiveRecord::Base
  belongs_to :section
   has_many :points, dependent: :destroy


  def up_points
    points.where(value: 1).count
  end

  def down_points
    points.where(value: -1).count
  end

  def total_points
    points.sum(:value)
  end
end
