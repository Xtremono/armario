class ClothesController < ApplicationController
  before_action :set_clothe, only: [:show, :edit, :update, :destroy]
  def index
    @clothes = Clothe.all
  end

  def show
    @clothe = Clothe.find(params[:id])
    @order = @clothe.orders.build
  end

  def new
    @clothe = Clothe.new
  end

  def create
    @clothe = Clothe.new(clothe_params)
    @clothe.user = current_user

    if @clothe.save
      redirect_to @clothe, notice: "La prenda se ha creado correctamente."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @clothe = Clothe.find(params[:id])
  end

  def update
    @clothe = Clothe.find(params[:id])

    if @clothe.update(clothe_params)
      redirect_to @clothe, notice: "La prenda se ha actualizado correctamente."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @clothe = Clothe.find(params[:id])
    @clothe.destroy
    redirect_to clothes_url, notice: "La prenda se ha eliminado correctamente."
  end
end

private

def clothe_params
  params.require(:clothe).permit(:name, :brand, :size, :price, :comment, :photo, :user_id)
end

def set_clothe
  @clothe = Clothe.find(params[:id])
end
