class Api::V1::DeliveryPartnersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    @delivery_partner = DeliveryPartner.new(deliver_partner_params)
    if @delivery_partner.save
      render json: {result: @delivery_partner, success: true  }, status: 201
    else
      render json: {result: @delivery_partner.errors.full_messages, success: false}, status: :unprocessable_entity
    end
  end

  def login
    @delivery_partner = DeliveryPartner.find_by(contact: deliver_partner_params[:contact])
    if @delivery_partner
      render json: {result: @delivery_partner, success: true }, status: 200
    else
      render json: { result: 'DeliveryPartner not found!'}, status: 422
    end
  end

  # GET /deliver_partners
  def index
    @delivery_partners = DeliveryPartner.all
    render json: { result: @delivery_partners, success: true }, status: 200
  end

  # GET /deliver_partners/:id
  def show
    @delivery_partner = DeliveryPartner.find(params[:id])
    render json: @delivery_partner
  rescue ActiveRecord::RecordNotFound
    render json: { error: "DeliveryPartner not found" }, status: :not_found
  end

  private

  def deliver_partner_params
    params.require(:delivery_partner).permit(:name, :email, :city, :address, :contact, :password)
  end
end