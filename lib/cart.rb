require_relative 'menu'

class Cart

  attr_reader :selected_dishes

  def initialize(menu = Menu.new)
    @selected_dishes = []
    @menu = menu
  end

  def select_dish(new_dish)
    @menu.list_of_dishes.each do |choosen_dish|
      @selected_dishes << choosen_dish if choosen_dish[:dish] == new_dish
    end
  end

  def your_selection
    add = 0
    @selected_dishes.each do |selection|
      puts "#{selection[:dish]}: £#{selection[:price]}, total £#{add += selection[:price].to_f}0"
    end
  end

  def give_total
    add = 0
    @selected_dishes.each do |selection|
      add += selection[:price].to_f
    end
    "£#{add.to_s}0"
  end
end
