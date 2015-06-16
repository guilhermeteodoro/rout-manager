class Route < ActiveRecord::Base
  belongs_to :origin, class_name: 'Location'
  belongs_to :destination, class_name: 'Location'

  validates_presence_of :distance, :origin, :destination
  validates :distance, numericality: { greater_than: 0 }
  validate :destination_is_different_from_origin

  private
  def destination_is_different_from_origin
    if (origin == destination) || (origin.name == destination.name)
      errors.add(:destination, 'can\'t be equal to origin')
    end
  end
end