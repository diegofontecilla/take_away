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
    expect { cart.selection_printer }.to output("1 ragu alla bolognese: £12.00, total £12.00\n").to_stdout
  end

  it 'can select three dishes and see the total price' do
    cart = Cart.new
    cart.select_dish('ragu alla bolognese')
    cart.select_dish('parmigiana')
    cart.select_dish('lasagna al forno')
    expect { cart.selection_printer }.to output("1 ragu alla bolognese: £12.00, total £12.00
1 parmigiana: £11.30, total £23.30\n1 lasagna al forno: £14.60, total £37.90\n").to_stdout
  end

  it 'can select four dishes and see the total price' do
    cart = Cart.new
    cart.select_dish('ragu alla bolognese')
    cart.select_dish('parmigiana')
    cart.select_dish('lasagna al forno')
    cart.select_dish('spaghetti alle vongole')
    expect { cart.selection_printer }.to output("1 ragu alla bolognese: £12.00, total £12.00
1 parmigiana: £11.30, total £23.30
1 lasagna al forno: £14.60, total £37.90\n1 spaghetti alle vongole: £12.50, total £50.40\n").to_stdout
  end

  it 'can select five dishes and see the total price' do
    cart = Cart.new
    cart.select_dish('ragu alla bolognese')
    cart.select_dish('parmigiana')
    cart.select_dish('lasagna al forno')
    cart.select_dish('spaghetti alle vongole')
    cart.select_dish('spaghetti alla carbonara')
    expect { cart.selection_printer }.to output("1 ragu alla bolognese: £12.00, total £12.00
1 parmigiana: £11.30, total £23.30
1 lasagna al forno: £14.60, total £37.90
1 spaghetti alle vongole: £12.50, total £50.40
1 spaghetti alla carbonara: £14.40, total £64.80\n").to_stdout
  end

  it 'can select same dish twice and will appear as 1 multiplied by 2' do
    cart = Cart.new
    cart.select_dish('ragu alla bolognese')
    cart.select_dish('parmigiana')
    cart.select_dish('ragu alla bolognese')
    expect { cart.selection_printer }.to output("2 ragu alla bolognese: £12.00, total £24.00
1 parmigiana: £11.30, total £35.30\n").to_stdout
  end
end
