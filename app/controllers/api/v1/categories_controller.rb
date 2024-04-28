module Api
  module V1
    class CategoriesController < ApplicationController
      def index
        @categories = Category.where(permitted_params)
        render json: @categories
      end

      def create
        @category = Category.new(permitted_params)
        if @category.save
          render status: :ok, json: @category.to_json
        else
          render status: :internal_server_error, json: @category.errors.full_messages
        end
      end

      def update
        @category = Category.find_by(id: params["id"])
        if @category.nil?
          render status: :not_found,
                 json:   { message: "Category with id #{params['id']} does not exist" }
        elsif @category.update(permitted_params)
          render status: :ok, json: @category.to_json
        else
          render status: :internal_server_error, json: @category.errors.full_messages
        end
      end

      def destroy
        @category = Category.find_by(id: params["id"])
        if @category.nil?
          render status: :not_found,
                 json:   { message: "Category with id #{params['id']} does not exist" }
        elsif @category.destroy
          render status: :ok,
                 json:   { message: "Categoy with id #{@category.id} destroyed successfully" }
        else
          render status: :internal_server_error, json: @category.errors.full_messages
        end
      end

      private

      def permitted_params
        if params["category"]
          params.require(:category).permit(:id, :name)
        else
          params.permit(:id, :name)
        end
      end

      def check_existence
        return unless @category.nil?

        render status: :not_found,
               json:   { message: "Category with id #{params['id']} does not exist" }
      end
    end
  end
end
