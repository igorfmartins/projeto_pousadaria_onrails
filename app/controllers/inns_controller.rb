class InnsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  
  def index
    redirect_to root_path
  end
  
  def new
    @inn = Inn.new
    @inn.user = current_user
  end

  def create
    @inn = Inn.new(inn_params)
    @inn.user = current_user

    if @inn.save
      flash[:notice] = 'Sua pousada foi cadastrada com sucesso!'
      redirect_to @inn
    else
      flash.now[:alert] = 'Não foi possível cadastrar a pousada.'
      render 'new'
    end
  end

  def edit
   @inn = Inn.find(params[:id])
  end

  def update
    @inn = Inn.find(params[:id])
    if @inn.update(inn_params)
     redirect_to @inn, notice: 'Pousada atualizada com sucesso.'
    else
     flash.now[:alert] = 'Pousada não atualizada.'
     render 'edit'
    end
  end 
  
  def show
    @inn = Inn.find(params[:id])
  end          
      

  private    
      
  def inn_params
    params.require(:inn).permit(:brand_name, :corporate_name, :cnpj, :contact_phone, :email, :full_address, :state, :city, :zip_code, :description, :rooms_max, :pets_accepted, :breakfast, :camping, :accessibility, :policies, :payment_methods, :check_in_time, :check_out_time, :active)
  end  
  
end