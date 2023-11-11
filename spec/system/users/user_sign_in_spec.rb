require 'rails_helper'

describe 'Usuário se autentica' do 
    it 'com sucesso' do 
        #Arrange
        User.create!(email: 'devdeve@outlook.com', password:'password')

        #Act
        visit root_path
        click_on 'Faça o Login'                       
        fill_in 'Email', with: 'devdeve@outlook.com'
        fill_in 'Senha', with: 'password'
        click_on 'Log in'      

        #Assert
        expect(page).to have_content 'Signed in successfully.'        
        expect(page).not_to have_link 'Entrar'  
        expect(page).to have_button 'Sair'      
        expect(page).to have_content 'devdeve@outlook.com'
    end    
    
    it 'e faz logout' do 
        #Arrange
        User.create!(email: 'devdeve@outlook.com', password:'password')

        #Act
        visit root_path
        click_on 'Entrar'                       
        fill_in 'Email', with: 'devdeve@outlook.com'
        fill_in 'Senha', with: 'password'
        click_on 'Log in'
        click_on 'Sair'

        #Assert
        expect(page).to have_content 'Signed out successfully.'
        expect(page).to have_link 'Faça o Login'
        expect(page).not_to have_button 'Sair'
        expect(page).not_to have_content 'devdeve@outlook.com' 
    end
end    
