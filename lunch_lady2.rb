
require_relative 'food'
require_relative 'order'

@main_dishes_array = [
    Food.new("1", "Pizza", 7.00),
    Food.new("2", "Tacos", 6.00),
    Food.new("3", "Cheeseburger", 5.00)
]
    
@side_dish_array = [
    Food.new("1", "Fries", 4.00),
    Food.new("2", "Apple Slices", 3.00),
    Food.new("3", "Rice Pilaf", 2.00),
    Food.new("4", "Breadsticks", 1.00) 
]

@the_order = Order.new 

def user_menu 
    system("clear")
    puts "================="
    puts "Welcome to Lunch"
    puts "Would you like to make an order? Y or N?"
    order_choice = gets.strip 
    if order_choice == "Y" || order_choice == "y"
        main_dishes 
    elsif order_choice == "N" || order_choice == "n"
        puts "Come back soon!"
        exit 
    else 
        puts "Invalid Choice."
        user_menu 
    end 
end 

def main_dishes 
    system("clear")
    puts "Please select a main dish by entering the number below."
    puts "All main dishes come with two side orders."
    puts "===Main Dishes==="
    # remember, Michelle: the "food" in this is just a temporary variable 
    print_food(@main_dishes_array)
    main_dish_choice = gets.strip 
    # searches for the food ID the user entered and then stores in the main dish variable in the order class 
    @main_dishes_array.each{ |food|
        if main_dish_choice == food.order_id 
            @the_order.main_dish = food 
        end 
    }
    # prevents anuthing from being entered to main dish variable if it doesn't match the above loop 
    if @the_order.main_dish == nil
        main_dishes
        return 
    end 

# this loop will continue running until either "if" or "elsif" are satisfied
# then the return kicks you onto the correct method 
    while true 

        puts "You would like #{@the_order.main_dish.name} for #{@the_order.main_dish.price}."
        puts "\nIs that correct? Y or N?"

        main_dish_confirmation = gets.strip 

        if main_dish_confirmation == "Y" || main_dish_confirmation == "y"
            puts "Confirmed. #{@the_order.main_dish.name} for #{@the_order.main_dish.price}."
            get_side_dishes 
            return 
        elsif 
            main_dish_confirmation == "N" || main_dish_confirmation == "n"
            @the_order.main_dish = nil 
            main_dishes
            return 
        end 
    end 
end 




def get_side_dishes 
    system("clear")
    puts "Please select two side dishes by their number."
    puts "===Side Dishes==="
    print_food(@side_dish_array) 

    while @the_order.side_dishes.length < 2  
        puts "What are your sides?"
        side_dish_choice = gets.strip 
        side_dish = nil 
        @side_dish_array.each{ |food|

            if side_dish_choice == food.order_id 
                side_dish = food 
            end 
        }

        if side_dish == nil
        next  
        end 

        puts "Did you want #{side_dish.name} for #{side_dish.price}? Y or N?"

        side_dish_confirmation = gets.strip 

        if side_dish_confirmation == "Y" || side_dish_confirmation == "y"
            @the_order.side_dishes << side_dish 

        elsif side_dish_confirmation == "N" || side_dish_confirmation == "n"
            next 
        end 
    end 
    order_print_out 
end 

def order_print_out
    puts "Your order is #{@the_order.main_dish.name}"
    puts "Your sides are"
    @the_order.side_dishes.each{|food|
        puts "#{food.name}"
    }
    puts  "Your total is $#{@the_order.get_total}."
    puts "Thank you for your order."
    exit
end 

def print_food(food_array)
    food_array.each { |food|
        puts "#{food.order_id}) #{food.name} for #{food.price}."
    }
end 


user_menu 