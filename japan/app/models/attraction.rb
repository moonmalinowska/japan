#require 'elasticsearch/model'

class Attraction < ActiveRecord::Base


  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks


  belongs_to :region#, touch: true
  belongs_to :category#, touch: true

  geocoded_by :address
  geocoded_by :full_address # can also be an IP address
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, :reverse_geocode         # auto-fetch coordinates



  def gmaps4rails_address
    address
  end

  acts_as_taggable # Alias for acts_as_taggable_on :tags
#  acts_as_taggable_on :tag_list, :name, :tag


  validates :name, presence: true, uniqueness: true, length: {within: 2..100}
  validates :description, presence: true, length: {minimum:  10}
  validates_presence_of :address, :opening_hour, :duration, :reservation, :picture
  #validates_presence_of :region_id, :category_id
  validates_length_of :more_info, :minimum => 5, :allow_blank => true

  #wyszukiwarka
  def self.search(search)
    if search
      where(["name LIKE ? ","%#{search}%"])
    else
      puts "Nie znaleziono"
    end
  end

  #geocoder
  def full_address
    "#{address} Japan"
  end



end