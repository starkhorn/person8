class PostsController < ApplicationController

  def index
    @posts = { :test => 123 }
    @users = [
      { :name => "1111" },
      { :name => "2222" }
    ]
  end

  def new
  end
end
