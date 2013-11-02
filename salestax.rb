module Utils
  def self.round(price)
    return price if (price % 5) == 0
    price + 5 - (price % 5)
  end

  def self.format_price(price)
    sprintf("%.2f", price / 100.00)
  end
end

class Goods
  attr_accessor :quantity, :name, :price

  def initialize(quantity, name, price)
    @quantity = quantity
    @name = name
    @price = price * 100
  end

  def subtotal
    @quantity * @price
  end

  def sales_tax
    Utils::round (subtotal * tax_rate.ceil)
  end

  def total
    subtotal + sales_tax
  end

  def tax_rate
    0.10
  end

  def display
    "#{@quantity} #{@name} : #{Utils.format_price(total)}"
  end
end

class Imported < Goods
  def tax_rate
    super  * 0.05
  end
end

class Exempt < Goods
  def tax_rate
    0
  end
end

class ImportedExempt < Exempt
  def tax_rate
    super + 0.5
  end
end

class Shoppingcart < Goods
  def initialize
    @products = []
  end

  def add_cart(product)
    @products << product
  end

  def calculate
    @total = 0
    @sales_tax = 0

    @products.each do |product|
      @sales_tax += product.sales_tax
      @total += product.total
    end
  end

  def receipt
    calculate 

    results = ""
    @products.each {|p| results += "#{p.display}\n"}

    results += "Sales Tax: #{Utils::format_price(@sales_tax)}\n"
    results += "Total: #{Utils::format_price(@total)}"
end

cart = Shoppingcart.new

cart.add_cart Exempt.new(1, "book", 12.49)
cart.add_cart Goods.new(1, "music CD", 14.99)
cart.add_cart Exempt.new(1, "chocolate bar", 0.85)

puts cart.receipt

puts

cart = Shoppingcart.new

cart.add_cart ImportedExempt.new(1, "imported chocolates", 10.00)
cart.add_cart Exempt.new(1, "imported perfume", 47.50)

puts cart.receipt

puts

cart = Shoppingcart.new

cart.add_cart Imported.new(1, "imported perfume", 27.99)
cart.add_cart Goods.new(1, "perfume", 18.99)
cart.add_cart Exempt.new(1, "packet of headache pills", 9.75)
cart.add_cart ImportedExempt.new(1, "imported chocolates", 11.25)

puts cart.receipt

end