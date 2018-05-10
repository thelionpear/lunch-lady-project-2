class Food 
    attr_accessor :order_id, :name, :price, :price_val

    def initialize(order_id, name, price)
        @order_id = order_id 
        @name = name
        @price_val = price 
    end

    def price
        return "$#{@price_val}0"
    end

end 