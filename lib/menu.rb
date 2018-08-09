class Menu

  def initialize
    @menu = [
      {dish: 'spaghetti alle vongole', price: '12.50'},
      {dish: 'spaghetti alla carbonara', price: '14.40'},
      {dish: 'parmigiana', price: '11.30'},
      {dish: 'lasagna al forno', price: '14.60'},
      {dish: 'ragu alla bolognese', price: '12.00'},
      {dish: 'risotto allo zafferano', price: '15.20'},
      {dish: 'gnocchi alla sorrentina', price: '9.50'},
      {dish: 'zucchine ripiene alla ligure', price: '14.70'}
    ]
  end

  def see_menu
    @menu.each { |dishes| puts "#{dishes[:dish]}: £#{dishes[:price]}" }
  end
end
