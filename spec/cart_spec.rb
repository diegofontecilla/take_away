require 'cart'

describe Cart do

  menu_array = [
    {dish: 'spaghetti alle vongole', price: '12.50'},
    {dish: 'spaghetti alla carbonara', price: '14.40'},
    {dish: 'parmigiana', price: '11.30'},
    {dish: 'lasagna al forno', price: '14.60'},
    {dish: 'ragu alla bolognese', price: '12.00'},
    {dish: 'risotto allo zafferano', price: '15.20'},
    {dish: 'gnocchi alla sorrentina', price: '9.50'},
    {dish: 'zucchine ripiene alla ligure', price: '14.70'}
    ]

  let(:fake_menu) { double(:menu, :list_of_dishes => menu_array) }
  let(:fake_messenger) { double(:messenger) }
  subject(:cart) { described_class.new(fake_menu, fake_messenger) }

  context '#select dish' do

    it 'user can select a dish from the menu' do
      cart.select_dish('spaghetti alle vongole')
      expect(cart.selection_printer).to eq([{dish: 'spaghetti alle vongole', price: '12.50'}])
    end

    it 'user can select several dishes from the menu' do
      cart.select_dish('spaghetti alle vongole')
      cart.select_dish('zucchine ripiene alla ligure')
      expect(cart.selection_printer).to eq([{dish: 'spaghetti alle vongole', price: '12.50'},
      {dish: 'zucchine ripiene alla ligure', price: '14.70'}])
    end
  end

  context '#give_total' do

    it 'return the sum of the prices of two dishes' do
      cart.select_dish('spaghetti alle vongole')
      cart.select_dish('zucchine ripiene alla ligure')
      expect(cart.give_total).to eq('£27.20')
    end
  end

  context '#selection_printer' do

    it 'user can see a selection of one dish, its price and the total' do
      cart.select_dish('spaghetti alle vongole')
      expect { cart.selection_printer }.to output("1 spaghetti alle vongole: £12.50, total £12.50\n").to_stdout
    end

    it 'user can see a selection of two dishes, its prices and the total' do
      cart.select_dish('spaghetti alle vongole')
      cart.select_dish('spaghetti alla carbonara')
      expect { cart.selection_printer }.to output("1 spaghetti alle vongole: £12.50, total £12.50
1 spaghetti alla carbonara: £14.40, total £26.90\n").to_stdout
    end

    it 'user can see a selection of three dishes, its prices and the total' do
      cart.select_dish('lasagna al forno')
      cart.select_dish('spaghetti alle vongole')
      cart.select_dish('spaghetti alla carbonara')
      expect { cart.selection_printer }.to output("1 lasagna al forno: £14.60, total £14.60
1 spaghetti alle vongole: £12.50, total £27.10
1 spaghetti alla carbonara: £14.40, total £41.50\n").to_stdout
    end
  end

  context '#place_order' do

    it 'send a text confirmation sms when there are selected dishes' do
      allow(fake_messenger).to receive(:send_message).and_return("message")
      cart.select_dish('lasagna al forno')
      expect(cart.place_order).to eq("message")
    end

    it 'print message saying that cart is empty when there are no dishes in the order' do
      expect { cart.place_order }.to output("Your cart is empty, please choose a dish\n").to_stdout
    end
  end
end
