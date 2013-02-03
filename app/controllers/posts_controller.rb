class PostsController < ApplicationController
  def index
    @user = {:first => "Ohm", :last => "Test" }
    @posts = { :test => 123 }
  end

  def show
  end
end
