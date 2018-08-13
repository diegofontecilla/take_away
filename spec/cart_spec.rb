require 'cart'
require 'menu'

describe Cart do

  let(:fake_menu) { double(:menu) }
  # let(:fake_new_dish) { double(:new_dish)}

  context '#select dish' do

    it 'user can select one dish from the menu' do
      cart = Cart.new
      cart.select_dish('spaghetti alle vongole')
      expect(cart.selected_dishes).not_to be_empty
    end

    # expect(cart.selected_dishes).to include('spaghetti alle vongole')
  end
end
