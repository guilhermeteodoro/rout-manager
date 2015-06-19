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
    map = Map.new(name: map_params[:name], paths: load_paths_from_params)

    if map.save
      render json: map, status: :created, location: map
    else
      render json: map.errors, status: :unprocessable_entity
    end
  end

  def update
    if @map.update(name: params[:name], paths: load_paths_from_params)
      head :no_content
    else
      render json: @map.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @map.destroy

    head :no_content
  end

  private
  def set_map
    @map = Map.find_by_name(params[:name])
  end

  def map_params
    params.require(:map).permit(:name, { paths: [:origin, :destination, :distance] })
  end

  def load_paths_from_params
    return [] unless map_params[:paths]

    map_params[:paths].map do |path|
      Path.new(origin: path[:origin], destination: path[:destination], distance: path[:distance])
    end
  end
end