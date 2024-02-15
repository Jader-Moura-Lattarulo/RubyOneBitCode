require "cpf_cnpj"

def clear
    system("clear") || system("cls")
end

def validation_cpf
    puts "Insira seu cpf (somente os números):"
    cpf = gets.chomp.to_i
    
    if valid_cpf = CPF.new(cpf).valid?
        clear
        formatted_cpf = CPF.new(cpf).formatted
        puts "O CPF #{formatted_cpf} é valido."
        puts
        program
    else
        clear
        formatted_cpf = CPF.new(cpf).formatted
        puts "O CPF #{formatted_cpf} é invalido."
        puts
        program
    end
end

def generation_cpf
    clear
    generated_cpf = CPF.generate
    formatted_cpf = CPF.new(generated_cpf).formatted
    puts "O CPF #{formatted_cpf} foi gerado com sucesso."
    puts 
    program
end

def program
    begin
        puts "O que você deseja fazer? "
        puts "Validar um CPF\t->\t1"
        puts "Criar um CPF\t->\t2"
        puts "Sair\t\t->\t3"
        print "Digite sua opção: "
        user_input = gets.chomp.to_i
        clear

        case user_input
            when 1
                validation_cpf
            
            when 2
                generation_cpf

            when 3
                puts "Obrigado, até a próxima!"
                puts

            else
                clear
                puts "Não foi possível identificar o que você deseja realizar."
                puts "Favor inserir uma opção valida:"
                puts
                program
            end
        end
end

program