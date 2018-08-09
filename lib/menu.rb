class Menu

  def initialize
    @menu = [
      {dish: 'spaghetti alle vongole', price: '12.50'}
    ]
  end

  def see_menu
    @menu.each { |dishes| puts "#{dishes[:dish]}: £#{dishes[:price]}" }
  end
end
