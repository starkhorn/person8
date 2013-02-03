class ApplicationController < ActionController::Base
  layout false
  protect_from_forgery

  before_filter :redirect_if_partial

  def render *args
    generate_master_models
    super
  end

protected
  def partial?
    true
  end

private
  def generate_master_models
    instance_variables = self.instance_variable_names.reject {|name| name.start_with? "@_"}

    @models = instance_variables.inject({}) do |model, name|
      model.merge({ name.delete("@") => self.instance_variable_get(name) })
    end
  end

  def redirect_if_partial
    if "text/html" == request.format && partial?
      redirect_to "/##{request.fullpath}"
    end
  end
end
