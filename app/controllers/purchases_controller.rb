class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :user_choice, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @form_object = FormObject.new
  end

  def create
    @form_object = FormObject.new(object_params)
    if @form_object.valid?
      pay_item
      @form_object.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private
  def object_params
    params.require(:form_object).permit(:postal_code, :area_id, :municipality, :address, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: object_params[:token],
      currency: 'jpy'
    )
  end

  def user_choice
    if current_user.id == Item.find(params[:item_id]).user_id
      redirect_to root_path
    elsif Item.find(params[:item_id]).purchase.present?
      redirect_to root_path
    end
  end
end
