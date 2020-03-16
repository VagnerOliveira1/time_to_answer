class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 
  has_one :profile_user
  accepts_nested_attributes_for :profile_user, reject_if: :all_blank
 #Validations
  validates :first_name, presence: true, length: { minimum:2 }, on: :update
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

#Virtual Attributes
  def full_name
    [self.first_name, self.last_name].join(' ')
  end
  
end
