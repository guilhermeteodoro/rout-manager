require_relative '../../lib/graph.rb'

class Map < ActiveRecord::Base
  has_many :routes, inverse_of: :map, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def to_graph
    Graph.new routes.map{ |route| [route.origin, route.destination, route.distance] }
  end
end
