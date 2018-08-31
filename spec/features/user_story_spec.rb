require 'cart'

describe 'User' do

  list = "spaghetti alle vongole: £12.50
spaghetti alla carbonara: £14.40
parmigiana: £11.30
lasagna al forno: £14.60
ragu alla bolognese: £12.00
risotto allo zafferano: £15.20
gnocchi alla sorrentina: £9.50
zucchine ripiene alla ligure: £14.70\n"

  it 'can see a list of dishes with prices on the screen' do
    cart = Cart.new
    expect { cart.see_the_menu }.to output(list).to_stdout
  end

  it 'can select one dish and see the total price' do
    cart = Cart.new
    cart.select_dish('ragu alla bolognese')
    expect { cart.your_selection }.to output("ragu alla bolognese: £12.00, total £12.00\n").to_stdout
  end

  it 'can select three dishes and see the total price' do
    cart = Cart.new
    cart.select_dish('ragu alla bolognese')
    cart.select_dish('parmigiana')
    cart.select_dish('lasagna al forno')
    expect { cart.your_selection }.to output("ragu alla bolognese: £12.00, total £12.00
parmigiana: £11.30, total £23.30\nlasagna al forno: £14.60, total £37.90\n").to_stdout
  end
end
