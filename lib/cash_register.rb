require 'pry'

class CashRegister

	attr_accessor :discount, :total, :items, :last_item

	def initialize(discount = 0)
		@total = 0
		# binding.pry
		#running a 
		@discount = discount
		# binding.pry
		@items = []
		@last_item = nil
	end

	def add_item(title, price, quantity = 1)
		self.total += (price * quantity)
		quantity.times do |item|
			items << title
		end
		self.last_item = {title: title, price: price}
	end

	def apply_discount
		if discount > 0 
			self.total = self.total * (1 - discount * 0.01)
			return "After the discount, the total comes to $#{self.total.to_i}."
		else
			return "There is no discount to apply."
		end
	end

	def void_last_transaction
		self.total -= self.last_item[:price]
	end

end
