class Route < ActiveRecord::Base
  belongs_to :map

  validates_presence_of :distance, :origin, :destination, :map
  validates :distance, numericality: { greater_than_or_equal: 1 }
end