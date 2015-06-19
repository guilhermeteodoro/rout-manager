class RoutesController < ApplicationController
  def solve
    route = Route.new(route_params)

    if route.valid?
      render json: route.solve, status: :created
    else
      render json: route.errors, status: :bad_request
    end
  end

  private
  def route_params
    params.permit(:map_name, :origin, :destination, :autonomy, :liter_price)
  end
end