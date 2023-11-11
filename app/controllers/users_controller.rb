class UsersController < ApplicationController
    before_action :authenticate_user!
  
    def register_inn
      if current_user.owner? && !current_user.inn.present?
        redirect_to new_inn_path
      else
        redirect_to root_path, notice: 'Você já cadastrou sua pousada.'
      end
    end
  end
  