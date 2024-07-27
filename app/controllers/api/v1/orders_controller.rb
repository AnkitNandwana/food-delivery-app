class Api::V1::OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    @order = Order.new(order_params)
    if @order.save
      render json: {result: @order, success: true  }, status: 201
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # GET /orders
  def index
  @orders = Order.all
  render json: { result: @orders, success: true }, status: 200
  end

  # GET /orders/:id
  def show
    @order = Order.find(params[:id])
    render json: @order
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Order not found" }, status: :not_found
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :restaurant_id, :food_item_ids, :status, :delivery_partner_id, :date, :amount)
  end
end
