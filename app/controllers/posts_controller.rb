class PostsController < ApplicationController
  def index
    @posts = { :test => 123 }
  end
end
