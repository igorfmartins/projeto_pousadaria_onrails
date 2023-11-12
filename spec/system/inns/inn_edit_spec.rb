
inn edit 

require 'rails_helper'

describe 'Owner edita uma pousada' do
    it 'com sucesso' do
        #Arrange
        owner = Owner.create!(name: 'João Silva', email: 'joao@example.com', password: 'password', password confirmation: 'password')
        inn = Inn.create!(brand_name: 'Pousada do João', corporate_name: 'Pousada Joao Corporativo LTDA', cnpj: '34567865432', contact_phone: '3187654325', email: 'pousadajoao@outlook.com', full_address: 'Rua Bonita, 23', state: 'PR', city: 'Curitiba', payment_methods: 'C/B e Pix', owner: owner)

        #Act
        login_as owner, scope: :owner
        visit inn_path(inn)
        click_on 'Editar Pousada'      
        fill_in "Nome Fantasia", with: 'Pousada Sob Nova Direção'     
        fill_in "Endereço", with: 'Rua Mudou, 432'
        fill_in "state", with: 'SC'
        fill_in "cidade", with: 'Itajaí'
        fill_in "metodos_pagamentos", with: 'só C/B'        

        #Arrange
        expect(page).to have_content 'Rua Mudou, 432'
        expect(page).to have_content 'Pousada Sob Nova Direção'
        expect(page).to have_content 'Itajaí'
        expect(page).to have_content 'só C/B'    
    end
end
