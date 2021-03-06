class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :sections, dependent: :destroy
  has_many :students
  belongs_to :school
  has_many :points, dependent: :destroy

end
