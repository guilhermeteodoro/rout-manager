class PathSerializer < ActiveModel::Serializer
  attributes :origin, :destination, :distance
end