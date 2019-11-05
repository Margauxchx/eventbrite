class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :attendances
  has_many :events, through: :attendances
  has_many :events
  
  after_create :welcome_send
  after_create :attendance_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
  
  def attendance_send
    UserMailer.attendance_email(self).deliver_now
  end 
  
end
