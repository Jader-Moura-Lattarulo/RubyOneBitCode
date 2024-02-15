senhas = Hash.new

def limpar_tela
  system("clear") || system("cls")
end

loop do
  puts "O que você deseja fazer?"
  puts "Pegar uma senha  \t\t->\t1"
  puts "Verificar senhas cadastradas \t->\t2"
  puts "Sair \t\t\t\t->\t3"
  resposta_usuario = gets.chomp.to_i
  limpar_tela
  
  case resposta_usuario
  when 1
    while true
    senha = sprintf('%05d', rand(1..99999))
    print "Qual seu nome? (Digite 'sair' para sair) "
    nome = gets.chomp
    limpar_tela
    puts "#{nome}, sua senha é #{senha}, aguarde ser chamado no painel."

    break if nome.downcase == 'sair'
  
    senhas[senha] = nome
    end

  when 2

    limpar_tela
    puts "Senhas registradas:"
    senhas.each { |senha, nome| puts "#{nome}: #{senha}"}

  when 3
    
    limpar_tela
    puts "Até breve."
    break

  else 
    puts "Escolha invalida."
  end
end