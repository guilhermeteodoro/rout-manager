class Map < ActiveRecord::Base
  has_many :routes, inverse_of: :map, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
