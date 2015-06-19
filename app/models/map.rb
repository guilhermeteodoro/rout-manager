class Map < ActiveRecord::Base
  has_many :paths, inverse_of: :map, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def to_graph
    Graph.new paths.map{ |path| [path.origin, path.destination, path.distance] }
  end
end
