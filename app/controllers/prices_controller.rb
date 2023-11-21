class PricesController < ApplicationController
  before_action :authenticate_user!


  def new
    @room = Room.find(params[:room_id])
    @price = Price.new
  end

  def show
  end

  def create
    @room = Room.find(params[:room_id])
    @price = Price.new(price_params)    
    if @price.save
      redirect_to @room, notice: 'Preço adicionado com sucesso.'
    else
      flash[:notice] = 'Ja existe um preço para esse período, não é permitido sobrepor preços.'
      render 'new'
    end
  end
  
  def destroy 
    price_id = request.original_url.split('.').last.to_i
   
    @price = Price.find_by(id: price_id)

    if @price
      @price.destroy
      redirect_to root_path, notice: 'Preço excluído com sucesso.'
    else
      puts "DEBUG: price_id=#{price_id}, xxxxxxxxxxxxx"
      redirect_to root_path, alert: 'Preço não encontrado.'
    end

  end

  private

  def price_params
    params.require(:price).permit(:start_date, :end_date, :room_id, :daily_rate)
  end
end
