class Location < ActiveRecord::Base
  has_many :routes
  has_many :destinations, through: :routes

  validates :name, presence: true
end