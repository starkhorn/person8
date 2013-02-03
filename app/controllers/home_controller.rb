class HomeController < ApplicationController
  layout "application"

  def partial?
    false
  end

  def index
    @title = "Starkhorn"
  end
end
