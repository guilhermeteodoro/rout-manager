class Route < ActiveRecord::Base
  belongs_to :location
  belongs_to :destination, class_name: 'Location'

  validates :distance, presence: true
end