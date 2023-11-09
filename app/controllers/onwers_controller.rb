class OwnersController < ApplicationController

    def index
      @owners = Owner.all
    end
              
    def new
      @owner = Owner.new
    end
        
    def create
      @owner = Owner.new(owner_params)
      if @owner.save
        redirect_to @owner, notice: 'Proprietário cadastrado com sucesso. Boas vindas a plataforma.'
      else
        flash.now[:alert] = 'Proprietário não cadastrado. Tente novamente.'
        render 'new'
      end
    end
        
    def edit
      @owner = Owner.find(params[:id])
    end
  
    def update
      @owner = Owner.find(params[:id])
      if @owner.update(supplier_params)
        redirect_to @owner, notice: 'Proprietário atualizado com sucesso.'
      else
        flash.now[:alert] = 'Proprietário não atualizado.Tente novamente.'
        render 'edit'
      end
    end
        
    private
        
    def owner_params
     params.require(:owner).permit(:nome_proprietario, :nome_social, :genero, :pronomes, :idade, :tax_id, :id, :address, :city, :state, :phone, :email)
    end
  end