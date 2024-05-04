module ResourcefulActions
  extend ActiveSupport::Concern

  included do
    before_action :set_model
    before_action :set_resource, only: %i[update destroy]
  end

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
    if @resource.update(resource_params)
      render status: :ok, json: @resource.to_json
    else
      render status: :internal_server_error, json: @resource.errors.full_messages
    end
  end

  def destroy
    if @resource.destroy
      render status: :ok,
             json:   { message: "#{controller_name.classify} with id #{@resource.id} destroyed
             successfully".strip }
    else
      render status: :internal_server_error, json: @resource.errors.full_messages
    end
  end

  private

  def set_model
    @model = controller_name.classify.constantize
  end

  def set_resource
    @resource = @model.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Resource not found" }, status: :not_found
  end

  def resource_params
    if model_name_in_params?
      params.require(@model.name.underscore.to_sym).permit(*@model.column_names.map(&:to_sym))
    else
      params.permit(*@model.column_names.map(&:to_sym))
    end
  end

  def model_name_in_params?
    params[@model.name.underscore.to_sym].present?
  end
end
