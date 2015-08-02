class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence:  true, uniqueness: true
  validates_numericality_of :age, less_than_or_equal_to: 100, greater_than: 0, only_integer: true, :allow_blank => true

  has_many :projects 
  has_many :ideas
  has_many :creativitycards
  has_many :questions 

end
