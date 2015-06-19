class Route
  include ActiveModel::Model

  attr_accessor :map, :origin, :destination, :autonomy, :liter_price

  validates_presence_of :map, :origin, :destination, :autonomy, :liter_price
  validates :autonomy, numericality: { greater_than: 0 }
  validates :liter_price, numericality: { greater_than: 0 }
  validate :attributes_types

  def solve
    route, distance = map.to_graph.shortest_path(origin, destination)

    {
      route: best_route,
      distance: distance,
      cost: distance / autonomy * liter_price
    }
  end

  private
  def attributes_types
    map.is_a?(Map) && origin.is_a?(String) && destination.is_a?(String)
  end
end