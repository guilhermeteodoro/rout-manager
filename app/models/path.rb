class Path < ActiveRecord::Base
  belongs_to :map

  validates_presence_of :distance, :origin, :destination, :map
  validates_uniqueness_of :origin, :destination, scope: [:map, :distance], case_sensitive: false
  validates :distance, numericality: { greater_than_or_equal_to: 1 }

  before_save do
    self.origin.upcase!
    self.destination.upcase!
  end
end