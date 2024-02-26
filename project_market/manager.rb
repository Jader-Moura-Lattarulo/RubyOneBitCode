class ProductManager
  attr_reader :products

  def initialize
    @products = []
  end

  def duplicate_check(product_name)
    normalized_name = product_name.downcase
    @products.any? { |product| product.name.downcase == normalized_name }
  end

  def add_product
    product = product_registration
    @products << product
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
  end

  def find_product_by_name(name)
    @products.find { |product| product.name.downcase == name.downcase }
  end

  def product_registration
    puts "Entre com as especificações do produto:"
    print "Nome: "
    name = gets.chomp

    while duplicate_check(name)
      existing_product = find_product_by_name(name)

      puts "Já existe um produto com esse nome:"
      existing_product.display_info
      print "Deseja sobrescrever o produto existente? (S/N): "
      overwrite_choice = gets.chomp.downcase

      if overwrite_choice == 's'
        existing_product.update_product_info
        return existing_product
      else
        puts "Insira um novo produto"
        # Receber outras informações do produto
        print "Preço: R$"
        price = gets.chomp.to_f
        print "Categoria: "
        category = gets.chomp.capitalize

        # Criar um novo objeto Product com as informações fornecidas
        new_product = Product.new(name, price, category)

        # Adicionar o novo produto à lista
        @products << new_product

        puts "Novo produto #{new_product.name} adicionado com sucesso!\n\n"

        return new_product
      end
    end
  end
end