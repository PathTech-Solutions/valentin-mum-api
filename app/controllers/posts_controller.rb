class PostsController < ApplicationController
  def index
    render json: { "test" => "third_deploy" }
  end
end
