class Region < ActiveRecord::Base
  has_many :attractions

  validates :name, presence: true, length: {within: 2..100}
end
