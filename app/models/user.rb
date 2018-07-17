class User < ActiveRecord::Base
  has_many :rolls
  has_many :joined_crews, through: :rolls, source: :crew
  
  has_many :crews
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
