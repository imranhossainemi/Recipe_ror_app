class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def create
    @food = current_user.foods.new(food_params)

    respond_to do |format|
      format.html do
        if @food.save
          flash[:success] = 'Food was successfully created.'
          redirect_to foods_path
        else
          flash.now[:error] = 'Failed to create new food.'
          render :new, status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy

    respond_to do |format|
      format.html do
        if @food.destroy
          flash[:success] = 'Food was successfully deleted.'
        else
          flash[:error] = 'Failed to delete selected food.'
        end
        redirect_to foods_path
      end
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end

end
