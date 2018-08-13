require_relative './menu'

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
end
