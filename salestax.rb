module Utils
  def self.round(amount)
    return amount if (amount % 5) == 0
    amount + 5 - (amount % 5)
  end

  def self.format_price(price)
    sprintf("%.2f", price / 100.00)
  end
end

class Goods
	include Utils 
	attr_accessor :quantity, :name, :price

	def initialize(quantity, name, price)
		@quantity = quantity
		@name = name
		@price = price		
	end

	def tax_rate
	  0.10
	end

	def sales_tax
		subtotal * tax_rate
	end

	def sub_total
		@price * @quantity
	end

	def total
		subtotal + tax_rate
	end
end

class Imported < Goods
	def tax_rate
		super + 0.05
	end	
end

class Exempt < Goods
	def tax_rate
		0
	end
end

class Cart
	include Utils
	
	attr_accessor :receptacle

	def initialize
		@receptacle = []
	end

	def add_item(item)
		@receptacle << item
	end

	def calc
		total = 0
		sales_tax = 0

		Goods.each do |goods|
		@sales_tax += goods.sales_tax
		@total += product.total
		end
	end
end

#first cart
book = Exempt.new(1, "Book", 12.49)
cd = Goods.new(1, "Music CD", 14.99)
chocolate = Exempt.new(1, "Chocolate", 0.85)

#second cart
imp_cholate1 = Imported.new(1, "Imported Chocolate", 10.00)
imp_perf1 = Imported.new(1, "Imported Perfume", 47.50)

#third cart
imp_perf2 = Imported.new(1, "Imported Perfume", 27.99)
perf = Goods.new(1, "Perfume", 18.99)
#you can't tell me these were incidental
head_pills = Exempt.new(1, "Packet of Headache Pills", 9.75)
imp_cholate2 = Imported.new(1, "Imported Chocolate", 11.25)

#put things into carts
cart1 = Cart.new 
cart1.add_item(book)
cart1.add_item(cd)
cart1.add_item(chocolate)


cart2 = Cart.new 
cart2.add_item(imp_cholate1)
cart2.add_item(imp_perf1)

cart3 = Cart.new 
cart3.add_item(imp_perf2)
cart3.add_item(perf)
cart3.add_item(head_pills)
cart3.add_item(imp_cholate2)

puts cart1
puts cart2
puts cart3