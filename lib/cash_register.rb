require 'pry'

class CashRegister

attr_accessor :discount, :total, :title, :price, :quantity, :item, :list, :last_transaction

    def initialize(discount = 0)
        @discount = discount 
        @total = 0 
        @list = []
    end 

    def add_item(title, price, quantity=1)
        self.total += price*quantity 
        count = 0
        while count < quantity
          @list << [title,price]
          count += 1
        end
        self.last_transaction = price*quantity
      
    end

    def apply_discount
        if @discount > 0
        discount_amount = (@discount.to_f/100 * @total)
        @total = @total - discount_amount 
        "After the discount, the total comes to $#{@total.to_i}."
        else 
            "There is no discount to apply."
        end
    end

    def items
        titles_only = []
        @list.each do |food|
            titles_only << food[0]
        end
       titles_only
        
    end

    def void_last_transaction
        self.total -= self.last_transaction
    end

end





















