class PricesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room

  def new
    @price = @room.prices.build
  end

  def create
    @price = @room.prices.build(price_params)
    if @price.save
      redirect_to room_path(@room), notice: 'Preço adicionado com sucesso.'
    else
      flash[:notice] = 'Ja existe um preço para esse período, não é permitido sobrepor preços.'
      render 'new'
    end
  end
  
  def destroy
  @price = Price.find(params[:id])
  @price.destroy
  redirect_to room_path(@room), notice: 'Preço excluído com sucesso.'
end

  private

  def set_room
    @room = Room.find(params[:room_id])  
  end

  def price_params
    params.require(:price).permit(:start_date, :end_date, :daily_rate)
  end
end
