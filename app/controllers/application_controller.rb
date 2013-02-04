class ApplicationController < ActionController::Base
  layout :view_layout
  protect_from_forgery
  before_filter { puts "partials = #{params[:partial]}"; @partial = ("true" == params[:partial]) }

  def render *args
    generate_master_models
    super
  end

protected
  def view_layout
    if @partial
      false
    else
      "application"
    end
  end

private
  def generate_master_models
    instance_variables = self.instance_variable_names.reject {|name| name.start_with? "@_"}

    @models = instance_variables.inject({}) do |model, name|
      model.merge({ name.delete("@") => self.instance_variable_get(name) })
    end
  end
end
