puts "Bem-vindo(a) a calculadora"
resposta_usuario = ""

begin
    
    puts "O que você deseja fazer? "
    puts "Fazer um calculo->\t1"
    puts "Sair\t\t->\t2"
    print "Digite sua opção: "
    resposta_usuario = gets.chomp.to_i

        if resposta_usuario == 1

            system('cls') || system('clear')
            puts "Você escolheu opção: #{resposta_usuario}"
            print "\nDigite o primeiro número inteiro: "
            number1 = gets.chomp.to_i
            print "Digite o segundo número inteiro: "
            number2 = gets.chomp.to_i

            puts "\nEscolha uma operação:\n"
            puts "Soma\t\t->\t+"
            puts "Subitração\t->\t-"
            puts "Multiplicação\t->\t*"
            puts "Divisão\t\t->\t/"

            choice = gets.chomp

            case choice
            when '+'
                system('cls') || system('clear')
                addition = number1 + number2
                puts "O resultado da soma é: #{addition}"
            when '-'
                system('cls') || system('clear')
                subtraction = number1 - number2
                puts "O resultado da subtração é: #{subtraction}"
            when '*'
                system('cls') || system('clear')
                times = number1 * number2
                puts "O resultado da multiplicação é: #{times}"
            when '/'
                system('cls') || system('clear')
                if number2 <= 0
                    puts "É impossível dividir por 0 ou por um valor negativo."
                else
                    system('cls') || system('clear')
                    division = number1 / number2
                puts "O resultado da soma é: #{division}"
                end 
            else
                system('cls') || system('clear')
                puts "Não foi possível identificar qual operação você deseja realizar."
            end

        elsif resposta_usuario == 2
            puts "Muito bem, até a próxima!"
        
        else
            puts "Por favor, insira uma resposta válida:"
        end
end while resposta_usuario != 2