class Route
  include ActiveModel::Model

  attr_accessor :map_name, :origin, :destination, :autonomy, :liter_price
  attr_writer :map

  validates_presence_of :origin, :destination, :autonomy, :liter_price
  validates_presence_of :map, message: 'map not found'
  validates :autonomy, numericality: { greater_than: 0 }
  validates :liter_price, numericality: { greater_than: 0 }
  validate :location_types

  def solve
    route, distance = map.to_graph.shortest_path(origin, destination)

    {
      route: route,
      distance: distance,
      cost: distance / autonomy * liter_price
    }
  end

  def map
    Map.find_by_name map_name
  end

  private
  def location_types
    origin.is_a?(String) && destination.is_a?(String)
  end
end