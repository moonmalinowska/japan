#require 'elasticsearch/model'

class Attraction < ActiveRecord::Base

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :region#, touch: true
  belongs_to :category#, touch: true


  validates :name, presence: true, length: {within: 2..100}
  validates :description, presence: true
  validates :address, presence: true
  validates :opening_hour, presence: true
  validates :duration, presence: true
  validates :reservation, presence: true
  validates :picture, presence: true

  #wyszukiwarka
  def self.search(search)
    if search
      where(["name LIKE ? ","%#{search}%"])
    else
      all
    end
  end




end