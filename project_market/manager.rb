#manager.rb

require_relative 'products.rb'

class ProductManager
  attr_reader :products

  def initialize
    @products = []
  end

  def duplicate_check (product_name)
    normalized_name = product_name.downcase
    @products.any? { |product| product.name.downcase == normalized_name}
  end

  def add_product
    product = Product.product_registration(self)
    @products << product
    Product.add_product_registration(product)
    puts "Produto #{product.name} adicionado com sucesso!\n\n"
    product
  end

  def display_all_products
    if @products.empty?
      puts "Estamos sem produtos."
    else
      puts "Lista de produtos:"
      @products.each do |product|
        product.display_info
      end
    end

    def product_registration
      puts "Entre com as especificações do produto:"
      print "Nome: "
      name = gets.chomp
        
      if duplicate_check(name)
        existing_product = find_product_by_name(name)
        
        puts "Já existe um produto com esse nome:"
        existing_product.display_info
        print "Deseja sobrescrever o produto existente? (S/N): "
        overwrite_choice = gets.chomp.downcase
        
        if overwrite_choice == 's'
          existing_product.update_product_info
          return existing_product
        else
          return nil
        end
      else
        print "Preço: R$"
        price = gets.chomp.to_f
        print "Categoria: "
        category = gets.chomp.capitalize
        
        Product.new(name, price, category)
      end
  end

  end
end
