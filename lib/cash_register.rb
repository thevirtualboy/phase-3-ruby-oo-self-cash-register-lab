class CashRegister
    attr_accessor :total, :discount, :items, :last

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @last = 0
    end

    def add_item(item, price, quantity = 1)
        @total=(@total+(price*quantity))
        @last = price*quantity
        quantity.times do
            @items << item
        end
    end

    def apply_discount
        if discount > 0
            @total -= @total * (@discount/100.0)
            return "After the discount, the total comes to $#{@total.to_i}."
        elsif discount == 0
            return "There is no discount to apply."
        end
    end

    def items
        return @items
    end

    def void_last_transaction
        @total=(@total-@last)
    end
    
end