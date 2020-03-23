class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 
  has_one :user_profile
  accepts_nested_attributes_for :user_profile, reject_if: :all_blank
 #Validations
  validates :first_name, presence: true, length: { minimum:2 }, on: :update, unless: :reset_password_token_present?
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

#Virtual Attributes
  def full_name
    [self.first_name, self.last_name].join(' ')
  end

  after_create :set_statistic

  private
  def set_statistic
    AdminStatistic.set_event(AdminStatistic::EVENTS[:total_questions])
  end

  def reset_password_token_present?
    !!$global_params[:user][:reset_password_token]
  end
  
end
