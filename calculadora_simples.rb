print "Digite o primeiro número inteiro: "
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
    addition = number1 + number2
    puts "O resultado da soma é: #{addition}"
when '-'
    subtraction = number1 - number2
    puts "O resultado da subtração é: #{subtraction}"
when '*'
    times = number1 * number2
    puts "O resultado da multiplicação é: #{times}"
when '/'
    if number2 <= 0
        puts "É impossível dividir por 0 ou por um valor negativo."
    else
        division = number1 / number2
    puts "O resultado da soma é: #{division}"
    end 
else
    puts "Não foi possível identificar qual operação você deseja realizar."
end