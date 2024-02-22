#products

require 'csv'

class Product
  attr_accessor :name, :price, :category

  def initialize(name, price, category)
    @name = name
    @price = price
    @category = category
  end

  def to_array
    [@name, @price, @category]
  end

  PRODUCTS_FILE = "products.csv"

  def self.product_registration(product_manager)
    puts "Entre com as especificações do produto:"
    print "Nome: "
    name = gets.chomp

    while product_manager.duplicate_check(name)
      puts "Já existe um produto com esse nome. Tente novamente."
      print "Nome: "
      name = gets.chomp
    end

    print "Preço: R$"
    price = gets.chomp.to_f
    print "Categoria: "
    category = gets.chomp.capitalize

    Product.new(name, price, category)
  end

  def self.add_product_registration(product)
    CSV.open(PRODUCTS_FILE, "a") do |csv|
      csv << product.to_array
    end

    puts "Produto adicionado com sucesso."
  end

  def display_info
    currency_symbol = "R$"

    puts "Produto: \t\t#{@name}"
    puts "Preço: \t\t\t#{currency_symbol}#{format('%.2f', @price)}"
    puts "Categoria: \t\t#{@category}"
    puts "------------------------------------"
  end
end
