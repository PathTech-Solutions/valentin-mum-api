class PostsController < ApplicationController
  def index
    render json: { "test" => "ci_cd_deploy" }
  end
end
