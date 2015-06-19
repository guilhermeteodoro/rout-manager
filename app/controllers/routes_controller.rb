class RoutesController < ApplicationController
  def solve
    route = Route.new(routes_params)

    if route.valid?
      render json: route.solve, status: :created
    else
      render json: route.errors, status: :bad_request
    end
  end

  private
  def routes_params
    params.require(:map).permit(:name, :origin, :destination, :autonomy, :liter_price)
  end
end