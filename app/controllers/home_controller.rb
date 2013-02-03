class HomeController < ApplicationController
  layout "application"
  skip_before_filter :redirect_to_angular, :only => :index

  def index
    @title = "Starkhorn"
  end
end
