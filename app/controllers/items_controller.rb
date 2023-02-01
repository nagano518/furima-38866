class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :user_choice, only: [:edit, :destroy]
  before_action :item_present, only: [:edit]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name,:content,:image,:category_id,:status_id,:delivery_charge_id,:area_id,:shipping_date_id,:price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def user_choice
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def item_present
    if @item.purchase.present?
      redirect_to root_path
    end
  end
end
