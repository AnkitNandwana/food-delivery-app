class Api::V1::FoodItemsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_food_item, only: [:destroy, :update]
  
  def create
    @food_item = FoodItem.new(food_item_params)
    if @food_item.save
      render json: {result: @food_item, success: true  }, status: 201
    else
      render json: @food_item.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    if @food_item.update(food_item_params)
      render json: {result: @food_item, success: true }, status: 200
    else
      render json: { result: 'FoodItem Not Saved!'}, status: 422
    end
  end

  def index
    @food_items = FoodItem.all.where(restaurant_id: params[:restaurant_id]).order(id: :desc)
    render json: @food_items
  end

  def show
    @food_item = FoodItem.find(params[:id])
    render json: @food_item
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Food Item not found" }, status: :not_found
  end

  def destroy
    if @food_item.destroy
      render json: {
        success: true,
        message: 'FoodItem Deleted SuccessFully!',
      }, status: 200
    end
  end

  private

  def food_item_params
    params.require(:food_item).permit(:name, :price, :image_path, :restaurant_id, :description)
  end

  def find_food_item
    @food_item = FoodItem.find(params[:id])
    render json: { result: 'FoodItem Not Found!'}, status: 422 unless @food_item   
  end
end
