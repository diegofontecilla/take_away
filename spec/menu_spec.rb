require 'menu'

describe Menu do

  context '#see_menu' do
    it 'print a dish with it\'s price' do
      menu = Menu.new
      expect { menu.see_menu }.to output("spaghetti alle vongole: £12.50\n").to_stdout
      # expect { print('foo') }.to output('foo').to_stdout
    end
  end
end
