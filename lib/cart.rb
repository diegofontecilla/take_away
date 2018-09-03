require_relative 'menu'
require_relative 'messenger'

class Cart

  def initialize(menu = Menu.new, messenger = Messenger.new)
    @selected_dishes = []
    @menu = menu
    @count_dish = []
    @messenger = messenger
  end

  def select_dish(new_dish)
    @menu.list_of_dishes.each do |choosen_dish|
      @selected_dishes << choosen_dish if choosen_dish[:dish] == new_dish
    end
  end

  def selection_printer
    add = 0
    @selected_dishes.each do |s|
      n = @selected_dishes.count(s)
      dish = "#{n} #{s[:dish]}: £#{s[:price]}, total £#{add += s[:price].to_f * n}0"
      puts dish if !@count_dish.include?(s)
      @count_dish << s
    end
  end

  def give_total
    add = 0
    @selected_dishes.each do |selection|
      add += selection[:price].to_f
    end
    "£#{add.to_s}0"
  end

  def see_the_menu
    @menu.see_menu
  end

  def place_order
    if !@selected_dishes.empty?
      selection_printer
      @messenger.send_message
    else
      puts "Your cart is empty, please choose a dish"
    end
  end

  private

  attr_reader :selected_dishes

end
