class OrdersController < ApplicationController
  before_action :set_clothe, only: [:new, :create]
  before_action :authenticate_user!
  def index
    @orders = current_user.orders
  end

  def new
    @order = Order.new
  end

  def create
    @clothe = Clothe.find(params[:clothe_id])
    @order = @clothe.orders.new(order_params)
    @order.user = current_user
    if @order.save
      @clothe.update(purchased: true)
      redirect_to my_orders_path, notice: "La orden se ha creado correctamente."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_clothe
    @clothe = Clothe.find(params[:clothe_id])
  end

  def order_params
    params.require(:order).permit(:price)
  end
end
