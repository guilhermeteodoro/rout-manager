class Location < ActiveRecord::Base
  belongs_to :map
  has_many :routes, foreign_key: :origin_id
  has_many :destinations, through: :routes

  validates_presence_of :name
  validates_uniqueness_of :name, scope: :map_id
end