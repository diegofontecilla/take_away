require 'cart'
require 'menu'

describe Cart do

  let(:fake_menu) { double(:menu) }
  subject(:cart) { described_class.new }
  # let(:fake_new_dish) { double(:new_dish)}

  context '#select dish' do

    it 'user can select a hash with dish and price from the menu' do
      cart.select_dish('spaghetti alle vongole')
      expect(cart.selected_dishes).not_to be_empty
    end

    it 'user can select several hashes with dishes and prices from the menu' do
      cart.select_dish('spaghetti alle vongole')
      cart.select_dish('zucchine ripiene alla ligure')
      expect(cart.selected_dishes).to include({dish: 'zucchine ripiene alla ligure', price: '14.70'})
    end
  end

  context '#give_total' do

    it 'return the sum of the prices of two dishes' do
      cart.select_dish('spaghetti alle vongole')
      cart.select_dish('zucchine ripiene alla ligure')
      expect(cart.give_total).to eq('£27.20')
    end
  end

  context '#your_selection' do

    it  'user can see a selection of one dish, its price and the total' do
      cart.select_dish('spaghetti alle vongole')
      expect { cart.your_selection }.to output("spaghetti alle vongole: £12.50, total £12.50\n").to_stdout
    end

    it  'user can see a selection of two dish, its prices and the total' do
      cart.select_dish('spaghetti alle vongole')
      cart.select_dish('spaghetti alla carbonara')
      expect { cart.your_selection }.to output("spaghetti alle vongole: £12.50, total £12.50\nspaghetti alla carbonara: £14.40, total £26.90\n").to_stdout
    end

    it  'user can see a selection of three dishes, its prices and the total' do
      cart.select_dish('lasagna al forno')
      cart.select_dish('spaghetti alle vongole')
      cart.select_dish('spaghetti alla carbonara')
      expect { cart.your_selection }.to output("lasagna al forno: £14.60, total £14.60\nspaghetti alle vongole: £12.50, total £27.10\nspaghetti alla carbonara: £14.40, total £41.50\n").to_stdout
    end
  end
end
