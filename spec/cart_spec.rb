require 'cart'
require 'menu'

describe Cart do

  let(:fake_menu) { double(:menu) }
  # let(:fake_new_dish) { double(:new_dish)}

  context '#select dish' do

    it 'user can select a hash with dish and price from the menu' do
      cart = Cart.new
      cart.select_dish('spaghetti alle vongole')
      expect(cart.selected_dishes).not_to be_empty
    end

    it 'user can select several hashes with dishes and prices from the menu' do
      cart = Cart.new
      cart.select_dish('spaghetti alle vongole')
      cart.select_dish('zucchine ripiene alla ligure')
      expect(cart.selected_dishes).to include({dish: 'zucchine ripiene alla ligure', price: '14.70'}
)
    end
    # expect(cart.selected_dishes).to include('spaghetti alle vongole')
  end
end
