class Path < ActiveRecord::Base
  belongs_to :map

  validates_presence_of :distance, :origin, :destination, :map
  validates :distance, numericality: { greater_than_or_equal_to: 1 }
end