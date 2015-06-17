class MapsController < ApplicationController
  before_action :set_map, only: [:show, :update, :destroy, :best_path]
  respond_to :json

  def index
    render json: Map.all
  end

  def show
    map = Map.find_by_name(params[:id])

    render json: { name: map.name, routes: map.routes }
  end

  def create
    map = Map.new(name: params[:name])
    map.routes ||= load_routes_from_params

    if map.save
      render json: { message: 'Map created successfuly' }, status: 201
    else
      render json: { error: map.errors.full_messages }
    end
  end

  def update
    map = Map.find_by_name(params[:id])
    map.routes = load_routes_from_params

    if map.save
      render json: { message: 'Map updated successfuly' }
    else
      render json: { error: map.errors.full_messages }
    end
  end

  def destroy
    map = Map.find_by_name(params[:id])

    if map.destroy
      render json: { message: 'Map destroyed successfuly' }
    else
      render json: { error: map.errors.full_messages }
    end
  end

  def best_path
    map = Map.find_by_name(params[:id])

    return render json: { error: 'Map not found' }, status: 404 unless map

    best_route, distance = map.to_graph.shortest_path(params[:origin], params[:destination])

    render json: { message: "Shortest path is #{ best_route.join(' ') } with #{ distance }km" }
  end

  private
  def set_map
    @map = Map.find_by_name(params[:id])
  end

  def load_routes_from_params
    return unless params[:routes] && params[:routes].kind_of?(Array)

    params[:routes].map do |route|
      Route.new(origin: route[:origin], destination: route[:destination], distance: route[:distance])
    end
  end
end