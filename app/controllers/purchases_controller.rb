class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @item = Item.find(params[:item_id])
    @form_object = FormObject.new
  end

  def create
    binding.pry
    @form_object = FormObject.new(object_params)
    if @form_object.valid?
      @form_object.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private
  def object_params
    params.require(:form_object).permit(:postal_code, :area_id, :municipality, :address, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
