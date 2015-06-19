module ControllerExceptions
  class ParammeterMissing < StandardError
    attr_accessor :param

    def initialize(param:)
      @param = param
    end
  end
end