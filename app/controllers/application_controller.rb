class ApplicationController < ActionController::Base
  layout false
  protect_from_forgery

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
  
end
