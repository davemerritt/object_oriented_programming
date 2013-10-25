
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

class Cart

	def initialize
		@receptacle []
	end

	def add_item(item)
		@receptacle << item
	end
	#this isn't done
end

book = Exempt.new(1, "book", 12.49)
cd = Goods.new(1, "cd", 14.99)
chocolate = Exempt.new(1, "chocolate", 0.85)

imp_cholate1 = Imported.new(1, "imp_cholate1", 10.00)
imp_perf1 = Imported.new(1, "imp_perf1", 47.50)

imp_perf2 = Imported.new(1, "imp_perf2", 27.99)
perfume = Goods.new(1, "perfume", 18.99)
head_pills = Exempt.new(1, "head_pills", 9.75)
imp_cholate2 = Imported.new(1, "imp_cholate2", 11.25)
#throws errors lol ok, maybe not just a "."" instead of ","" I need sleep.