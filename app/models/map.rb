class Map < ActiveRecord::Base
  has_many :paths, inverse_of: :map, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  def to_graph
    Graph.new paths.map{ |path| [path.origin, path.destination, path.distance] }
  end

  def self.find_by_name(name)
    return nil unless name
    where("lower(name) = ?", name.downcase).take
  end
end
