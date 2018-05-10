class Order 

    attr_accessor :main_dish, :side_dishes, :get_total

    @main_dish 

    def initialize()
        @side_dishes = []
    end

    def get_total
        total = @main_dish.price_val

        @side_dishes.each { |food|
            total = total + food.price_val
        }

        return total
    end
end 