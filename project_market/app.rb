require_relative 'manager.rb'
require_relative 'stock.rb'

product_manager = ProductManager.new
stock = Stock.new(product_manager)

loop do
  puts "1. Adicionar Produto"
  puts "2. Exibir Todos os Produtos"
  puts "3. Exibir Estoque"
  puts "4. Sair"
  print "Escolha uma opção: "
  choice = gets.chomp.to_i

  case choice
  when 1
    new_product = stock.add_product(product, quantity)  
    product_manager.add_product(new_product) if new_product
    stock.update_inventory
  when 2
    product_manager.display_all_products
  when 3
    stock.display_inventory
  when 4
    puts "Saindo do programa. Adeus!"
    break
  else
    puts "Opção inválida. Tente novamente."
  end
end
