class ApplicationController < ActionController::API
  before_action :set_model
  before_action :set_resource, only: %i[update destroy]

  def index
    @resources = @model.where(resource_params)
    render json: @resources
  end

  def create
    @resource = @model.new(resource_params)
    if @resource.save
      render status: :ok, json: @resource.to_json
    else
      render status: :internal_server_error, json: @resource.errors.full_messages
    end
  end

  def update
    if @resource.nil?
      render status: :not_found,
             json:   { message: "#{controller_name.classify} with id #{params['id']}
             does not exist".strip }
    elsif @resource.update(resource_params)
      render status: :ok, json: @resource.to_json
    end
    render status: :internal_server_error, json: @resource.errors.full_messages
  end

  def destroy
    if @resource.nil?
      render status: :not_found,
             json:   { message: "#{controller_name.classify} with id #{params['id']}
             does not exist".strip }
    elsif @resource.destroy
      render status: :ok,
             json:   { message: "#{controller_name.classify} with id #{@resource.id}
             destroyed successfully".strip }
    else
      render status: :internal_server_error, json: @resource.errors.full_messages
    end
  end

  private

  def set_model
    @model = controller_name.classify.constantize
  end

  def set_resource
    @resource = @model.find_by(id: params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Resource not found" }, status: :not_found
  end

  def resource_params
    params.permit!
  end
end
