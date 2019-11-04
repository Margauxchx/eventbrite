class Event < ApplicationRecord
  belongs_to :user
  has_many :attendances
  has_many :users, through: :attendances
  
  validates :start_date, presence: true 
    #if: :not_in_past?
  validates :duration, presence: true,
    numericality: { greater_than: 0, only_integer: true } 
    #if: :multipe_of_5?
  validates :title, presence: true, 
    length: { in: 5..140 }
  validates :description, presence: true, 
    length: { in: 20..1000 }
  validates :price, presence: true,
     numericality: { greater_than: 0, less_than_or_equal_to: 1000, only_integer: true }
  validates :location, presence: true
end
