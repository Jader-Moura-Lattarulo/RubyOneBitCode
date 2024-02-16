class User
    @@user_count = 0
  
    def initialize(name)
      @name = name
      @@user_count += 1
      puts "User #{@@user_count} adicionado com o nome #{@name}!"
      hello
    end
  
    def hello
      puts "Seja bem-vindo, #{@name}!"
    end
  end
  
  def criar_novo_usuario
    puts "Digite o nome do usuário:"
    name = gets.chomp
    User.new(name)
  end
  
  usuarios = []
  
  loop do
    puts "Deseja adicionar um novo usuário? (Digite 'sim' ou 'não')"
    resposta = gets.chomp.downcase
  
    if resposta == 'sim'
      usuarios << criar_novo_usuario
    elsif resposta == 'não'
      puts "Encerrando o programa. Adeus!"
  
        usuarios.each_with_index do |usuario, index|
        formatted_index = sprintf('%03d',index + 1)
        puts "Nome #{formatted_index}: #{usuario.instance_variable_get(:@name)}"
    end
  
      break
    else
      puts "Resposta inválida. Por favor, digite 'sim' ou 'não'."
    end
  end
  