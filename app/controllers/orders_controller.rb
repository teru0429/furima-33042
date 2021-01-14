class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :select_item, only: [:index, :create]
  before_action :sold_out_item, only: [:index]
  before_action :move_to_index, only: [:index]

  def index
    @user_order = UserOrder.new
  end

  def create
    @user_order = UserOrder.new(purchase_history_params)
    if @user_order.valid?
      pay_item
      @user_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def purchase_history_params
    params.require(:user_order).permit(:address, :postal_code, :city, :building_number, :prefecture_id, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def select_item
    @item = Item.find(params[:item_id])
  end

  def sold_out_item
    redirect_to root_path if @item.order.present?
  end

  def move_to_index
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_history_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end