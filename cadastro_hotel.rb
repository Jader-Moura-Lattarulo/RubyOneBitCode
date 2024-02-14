def gerar_numero_reserva(cadastro)
    numero_reserva = nil
    loop do
      numero_reserva = rand(1..99999).to_s.rjust(5, '0')
      break numero_reserva unless cadastro.any? { |_, cliente| cliente[:numero_reserva] == numero_reserva }
    end
  end
  
  def gerar_cliente_id(cadastro)
    "cliente#{cadastro.size + 1}"
  end
  
  contador_clientes = 1
  cadastro_cliente = {}
  
  begin
    puts "Bem-vindo ao Hotel do Jader"
    puts "\nO que gostaria de fazer?"
    puts "\nRealizar cadastro\t->\t1"
    puts "Verificar reserva\t->\t2"
    puts "Realizar Check-in\t->\t3"
    puts "Realizar Check-out\t->\t4"
    puts "Ver todas as reservas\t->\t5"
    puts "Sair\t\t\t->\t6"
    print "\nDigite a opção desejada: "
  
    resposta_cliente = gets.chomp.to_i
  
    case resposta_cliente
    when 1
        print "Digite seu nome: "
        nome = gets.chomp
        print "Número de quartos desejados: "
        quartos = gets.chomp.to_i
      
        numero_reserva = gerar_numero_reserva(cadastro_cliente)
        cliente_id = gerar_cliente_id(cadastro_cliente)
      
        cadastro_cliente[cliente_id] = {
          nome: nome,
          quartos: quartos,
          checkin_realizado: false,
          data: nil,
          numero_reserva: numero_reserva
        }
      
        puts "\nCadastro realizado com sucesso!"
        puts "Seu número de reserva é: #{numero_reserva}"
  
    when 2

        print "Digite seu número de reserva: "
        numero_reserva = gets.chomp

        cliente_encontrado = cadastro_cliente.values.find { |cliente| cliente[:numero_reserva] == numero_reserva }

        if cliente_encontrado
            puts "\nReserva encontrada:"
            puts "Nome: #{cliente_encontrado[:nome]}"
            puts "Número de quartos: #{cliente_encontrado[:quartos]}"
        else
            puts "\nNúmero de reserva não encontrado."
        end
    
    when 3

        print "Digite seu número de reserva: "
        numero_reserva = gets.chomp

        cliente_encontrado = cadastro_cliente.values.find { |cliente| cliente [:numero_reserva] == numero_reserva}

        if cliente_encontrado
            cliente_encontrado[:checkin_realizado] = true
            cliente_encontrado[:data] = Time.now.strftime("%Y-%m-%d %H:%M:%S")

            puts "\nCheck-in realizado com sucesso!"
        else
            puts "\nNúmero de reserva não encontrado."
        end
    when 4
        print "Digite seu número de reserva: "
        numero_reserva = gets.chomp

        cliente_encontrado = cadastro_cliente.values.find { |cliente| cliente[:numero_reserva] == numero_reserva}

        if cliente_encontrado
            cliente_encontrado[:checkin_realizado] = false
            cliente_encontrado[:data] = nil

            puts "\nCheck-ou realizado com sucesso!"
        else
            puts "\nNúmero de reserva não encotrado."
        end
    
    when 5
        puts"\nLista de todos os cadastros:"

        cadastro_cliente.each do |client_id, cliente_info|
        puts "\nCliente ID: #{cliente_id}"
        puts "Nome: #{cliente_info[:nome]}"
        puts "Número de quartos: #{cliente_info[:quartos]}"
        puts "Check-in realizado: #{cliente_info[:checkin_realizado]}"
        puts "Data: #{cliente_info[:data]}"
        puts "Número de reserva: #{cliente_info[:numero_reserva]}"
        end
    
    when 6

        puts "\nObrigado por escolher o Hotel do Jader. Até breve!"

    else
        
        puts "\nOpção inválida. Por favor, escolha uma opção valida."
    end

end while resposta_cliente != 6        
