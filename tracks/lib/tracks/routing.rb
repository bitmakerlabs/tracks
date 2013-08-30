module Tracks

  class Application

    def get_controller_and_action(env)
      _before, controller, action, _after = env["PATH_INFO"].split('/', 4)
      begin
        controller = Object.const_get("#{controller.capitalize}Controller")
      rescue
        controller = false
      end
      [controller, action]
    end

  end

end
