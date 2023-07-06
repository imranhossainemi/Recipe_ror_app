require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before(:each) do
    @user = User.new(name: 'Tom', email: 'tom@example.com', password: '123456')
    @recipe = @user.recipes.new(name: 'pizza', preparation_time: 1, cooking_time: 1, description: 'pizza', public: true)
  end

  it 'recipe name' do
    expect(@recipe.name).to eq('pizza')
  end

  it 'recipe prep time' do
    expect(@recipe.preparation_time).to eq(1)
  end

  it 'recipe cooking time' do
    expect(@recipe.cooking_time).to eq(1)
  end

  it 'recipe description' do
    expect(@recipe.description).to eq('pizza')
  end

  it 'recipe public' do
    expect(@recipe.public).to eq(true)
  end
end
