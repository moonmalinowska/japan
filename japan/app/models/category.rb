class Category < ActiveRecord::Base
  has_many :attractions

  validates :name, presence: true, length: {within: 2..100}

 # searchable do
 #   text :name
 #   text :attractions do
 #     text :name, boost => 5
 #     text :tag, :description, :address
 #     end
 # end
end
