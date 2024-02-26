require_relative 'manager.rb'
require_relative 'products.rb'

product_manager = ProductManager.new

loop do
  puts "1. Adicionar Produto"
  puts "2. Exibir Todos os Produtos"
  puts "3. Sair"
  print "Escolha uma opção: "
  choice = gets.chomp.to_i

  case choice
  when 1
    new_product = product_manager.add_product
  when 2
    product_manager.display_all_products
  when 3
    puts "Saindo do programa. Adeus!"
    break
  else
    puts "Opção inválida. Tente novamente."
  end
end