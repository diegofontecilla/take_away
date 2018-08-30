require 'cart'

describe Cart do

  let(:fake_menu) { double(:menu) }
  subject(:cart) { described_class.new }
  subject(:cart_2) { described_class.new(fake_menu) }

  context '#select dish' do

    it 'user can select a dish from the menu' do
      menu_array = [{dish: 'spaghetti alle vongole', price: '12.50'}]
      allow(fake_menu).to receive(:list_of_dishes).and_return(menu_array)
      cart_2.select_dish('spaghetti alle vongole')
      expect(cart_2.selected_dishes).to eq(menu_array)
    end

    it 'user can select several dishes from the menu' do
      menu_array = [{dish: 'spaghetti alle vongole', price: '12.50'},
                    {dish: 'zucchine ripiene alla ligure', price: '14.70'}]
      allow(fake_menu).to receive(:list_of_dishes).and_return(menu_array)
      cart_2.select_dish('spaghetti alle vongole')
      cart_2.select_dish('zucchine ripiene alla ligure')
      expect(cart_2.selected_dishes).to eq(menu_array)
    end
  end

  context '#give_total' do

    it 'return the sum of the prices of two dishes' do
      menu_array = [{dish: 'spaghetti alle vongole', price: '12.50'},
                    {dish: 'zucchine ripiene alla ligure', price: '14.70'}]
      allow(fake_menu).to receive(:list_of_dishes).and_return(menu_array)
      cart_2.select_dish('spaghetti alle vongole')
      cart_2.select_dish('zucchine ripiene alla ligure')
      expect(cart_2.give_total).to eq('£27.20')
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
