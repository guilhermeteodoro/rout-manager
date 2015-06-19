class ApplicationController < ActionController::API
  include ActionController::Serialization

  rescue_from(ActionController::ParameterMissing, ControllerExceptions::ParammeterMissing) do |e|
    error = { e.param => 'parameter is required' }
    response = { errors: [error] }
    render json: response, status: :unprocessable_entity
  end

  private
  def check_for_params(*params_to_check)
    params_to_check.each do |param|
      raise ControllerExceptions::ParammeterMissing.new(param: param) unless params[param]
    end
  end
end