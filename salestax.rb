class Goods

	attr_accessor :quantity, :name, :price

	def initialize(quantity, name, price)
		@quantity = quantity
		@name = name
		@price = price		
	end

	def sub_total
		@price * @quantity
	end

	def sales_tax
	  0.10
	end

	def total
		subtotal + sales_tax
	end
end

class Imported < Goods
	def sales_tax
		super + 0.05
	end	
end

class Exempt < Goods
	def sales_tax
		0
	end
end

