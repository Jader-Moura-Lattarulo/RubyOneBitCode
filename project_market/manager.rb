require_relative 'products'

class ProductManager
    attr_reader :products

    def initialize
        @products = []
    end

    def add_product
        puts "Entre com as especificações do produto:"
        print "Nome: "
        name = gets.chomp
        print "Preço: R$"
        price = gets.chomp.to_f
        print "Categoria: "
        category = gets.chomp
        print "Data de validade: "
        expiry_date = gets.chomp
        print "Quantidade: "
        amount = gets.chomp.to_i

        product = Product.new(name, price, category, expiry_date, amount)
        @products << product
        puts "Produto #{name} adicionado com sucesso!\n\n"
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
end