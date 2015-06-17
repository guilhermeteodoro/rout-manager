class MapsController < ApplicationController
  before_action :set_map, only: [:show, :update, :destroy, :best_route]

  def index
    @maps = Map.all

    render json: @maps
  end

  def show
    render json: @map
  end

  def create
    map = Map.new(map_params)
    map.routes ||= load_routes_from_params

    if map.save
      render json: map, status: :created, location: map
    else
      render json: map.errors, status: :unprocessable_entity
    end
  end

  def update
    if @map.update(name: params[:name], routes: load_routes_from_params)
      head :no_content
    else
      render json: @map.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @map.destroy

    head :no_content
  end

  def best_route
    return render json: { error: 'Map not found' }, status: :not_found unless @map

    best_route, distance = map.to_graph.shortest_path(params[:origin], params[:destination])

    render json: { message: "Shortest path is \"#{ best_route.join(' ') }\" with #{ distance }km" }
  end

  private
  def set_map
    @map = Map.find_by_name(params[:name])
  end

  def map_params
    params.require(:map).permit(:name, { routes: [:origin, :destination, :distance] })
  end

  def load_routes_from_params
    return unless params[:routes] && params[:routes].kind_of?(Array)

    params[:routes].map do |route|
      Route.new(origin: route[:origin], destination: route[:destination], distance: route[:distance])
    end
  end
end