require 'rails_helper'

describe 'Owner cadastra uma pousada' do
    it 'com sucesso' do
        #Arrange
        owner = Owner.create!(name: 'João Silva', email: 'joao@example.com', password: 'password', password confirmation: 'password')
        login_as owner, scope: :owner
        
        #Act
        visit root_path
        click_on 'Cadastrar Pousada'
        fill_in 'Nome Fantasia', with: 'Pousada do João'
        fill_in 'Razão Social', with: 'Rua das Flores, 123'        
        fill_in 'cnpj', with: '457982156'
        fill_in 'telefone', with: '13978425698'        
        fill_in 'email', with: 'pousadajoao@outlook.com'
        fill_in 'Endereço', with: 'Rua das Flores, 123'
        fill_in 'estado', with: 'SP'
        fill_in 'cidade', with: 'Santos'
        fill_in 'metodos_pagametos', with: 'C/B e PIX'        
        click_on 'Criar Pousada'
        
        #Arrange
        expect(page).to have_content 'Pousada cadastrada com sucesso.'
        expect(page).to have_content 'Pousada do João'
        expect(page).to have_content 'Rua das Flores, 123'
    end

    it 'com dados em branco' do
        owner = Owner.create!(name: 'João Silva', email: 'joao@example.com', password: 'password', password confirmation: 'password')
        login_as owner, scope: :owner
    
        visit root_path
        click_on 'Cadastrar Pousada'
        fill_in 'Nome da Pousada', with: ''
        fill_in 'Endereço', with: ''
        click_on 'Criar Pousada'
        
        expect(page).to have_content 'Não foi possível cadastrar a pousada.'
        expect(page).to have_content "Nome da Pousada não pode ficar em branco"
        expect(page).to have_content "Endereço não pode ficar em branco"
    end
end