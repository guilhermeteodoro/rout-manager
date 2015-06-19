class MapSerializer < ActiveModel::Serializer
  attributes :name

  has_many :paths
end