class ApplicationController < ActionController::Base
  layout false
  protect_from_forgery

  before_filter :redirect_to_angular

  def render *args
    generate_master_models
    super
  end

private
  def generate_master_models
    instance_variables = self.instance_variable_names.reject {|name| name.start_with? "@_"}

    @models = instance_variables.inject({}) do |model, name|
      model.merge({ name.delete("@") => self.instance_variable_get(name) })
    end
  end

  def redirect_to_angular
    # check if the user uses a direct (deep-link) url
    # need to find a better solution for this
    puts "f path = #{request.fullpath}"
    if "text/html" == request.format
      fullpath = request.fullpath
      parts = request.fullpath.split("?")
      paths = parts[0].split("/")

      if paths[-1].include?(".")
        lastPath = paths.pop
        paths.push lastPath[0 ... lastPath.rindex(".")]
      end

      parts[0] = paths.join("/")

      redirect_to "/##{parts.join("?")}"
    end
  end
end
