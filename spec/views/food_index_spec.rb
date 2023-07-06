require 'rails_helper'

RSpec.describe 'Foods', type: :feature do
  include Devise::Test::IntegrationHelpers
  describe 'index' do
    before(:each) do
      @user = User.create(name: 'imran', email: 'imran@mail.com', password: 'recipe')
      sign_in @user
      @food = Food.create(user: @user, name: 'Apple', measurement_unit: 'kg', quantity: 1, price: 100)
      visit foods_path
    end
    it 'renders name of food' do
      expect(page).to have_content(@food.name)
    end

    it 'renders measurement_unit of the food' do
      expect(page).to have_content(@food.measurement_unit)
    end

    it 'renders price of the food' do
      expect(page).to have_content(100)
    end

    it 'renders a button to add food' do
      expect(page).to have_content('Add Food')
    end

    it 'redirects to a form for new food' do
      click_link 'Add Food'
      expect(page).to have_current_path(new_food_path)
    end
  end
end
