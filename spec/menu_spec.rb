require 'menu'

describe Menu do

  context '#see_menu' do
    # it 'print a dish with it\'s price' do
    #   menu = Menu.new
    #   expect { menu.see_menu }.to output("spaghetti alle vongole: £12.50\n").to_stdout
    # end

    it 'print a list of dishes with prices' do
      menu = Menu.new
      list = "spaghetti alle vongole: £12.50\nspaghetti alla carbonara: £14.40
parmigiana: £11.30\nlasagna al forno: £14.60
ragu alla bolognese: £12.00\nrisotto allo zafferano: £15.20
gnocchi alla sorrentina: £9.50\nzucchine ripiene alla ligure: £14.70\n"
      expect { menu.see_menu }.to output(list).to_stdout
    end
  end
end
