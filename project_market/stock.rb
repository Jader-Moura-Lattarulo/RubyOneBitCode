require_relative 'products.rb'

class Stock
    
    def initialize (product_manager)
        @product_manager = product_manager
        @inventory = {}
    end

    def update_inventory
        @product_manager.products.each do |product|
            @inventory[product] ||= 0
            @inventory[product] += product.amount
        end
    end

    def add_product(product, quantity)
        @inventory[product] ||= 0
        @inventory[product] += quantity
        puts "A #{quantity} do produto: #{product.name} foi adicionado ao estoque."
    end

    def remove_product(product, quantity)
        if @inventory.key?(product) && @inventory[product] >= quantity
            @inventory[product] -= quantity
            remaning_quantity = @inventory[product]
            puts "A #{quantity} do produto: #{product.name} foi removido do estoque."
            puts "Restam #{remaning_quantity} unidades."
        else
            current_quantity = @inventory[product] || 0
            puts "Quantidade insuficiente do produto #{product.name}, possuímos #{current_quantity} unidades em estoque."
        end
    end
    
    def display_inventory
        if @inventory.empty?
            puts "O estoque está vazio."
        else
            puts "Estoque atual:"
            @inventory.each do |product, quantity|
                puts "#{product.name}: #{quantity} unidades"
            end
        end
    end
end