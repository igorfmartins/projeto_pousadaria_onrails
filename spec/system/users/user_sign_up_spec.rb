require 'rails_helper'

describe 'Owner cria uma conta' do
    it 'com sucesso' do
        #Arrange

        #Act
        visit root_path
        click_on 'Crie uma conta'        
        fill_in 'Email', with: 'joao@example.com'
        fill_in 'Password', with: 'password'
        fill_in 'Password confirmation', with: 'password'
        click_on 'Sign up'

        #Assert        
        expect(page).to have_content 'Welcome! You have signed up successfully.'
        expect(page).to have_content 'joao@example.com'
    end

    it 'com dados em branco' do
        #Arrange

        #Act
        visit root_path
        click_on 'Registrar como Proprietário'
        fill_in 'Email', with: ''
        fill_in 'Password', with: ''
        fill_in 'Password confirmation', with: ''
        click_on 'Sign up'  

        #Assert
        expect(page).to have_content 'Não foi possível cadastrar o proprietário.'
        expect(page).to have_content "Email can't be blank"
        expect(page).to have_content "Password can't be blank"     
    end   
end
