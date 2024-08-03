module ResourcefulActions
  extend ActiveSupport::Concern

  included do
    before_action :set_model
    before_action :set_resource, only: %i[update destroy]
  end

  def index
    @resources = @model.includes(referenced_associations).where(resource_params)

    render json: @resources.as_json(include: referenced_associations)
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

  def referenced_associations
    # Extract attribute names and remove `_id` to find associated names
    foreign_keys = @model.column_names.select { |col| col.end_with?("_id") }
    association_names = foreign_keys.map { |fk| fk.chomp("_id").to_sym }

    # Filter only associations that exist in the model
    @model.reflect_on_all_associations
          .select { |assoc| association_names.include?(assoc.name) }
          .map(&:name)
  end
end
