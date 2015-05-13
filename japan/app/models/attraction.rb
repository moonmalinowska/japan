class Attraction < ActiveRecord::Base
  belongs_to :region
  belongs_to :category

  validates :name, presence: true, length: {within: 2..100}
  validates :description, presence: true
  validates :address, presence: true
  validates :opening_hour, presence: true
  validates :duration, presence: true
  validates :reservation, presence: true
  validates :picture, presence: true
end
