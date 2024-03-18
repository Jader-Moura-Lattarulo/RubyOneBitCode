require 'io/console'
require 'date'

print "Qual é o seu nome? "
nome = gets.chomp

loop do
  data_digitada = ""

  loop do
    system("clear") || system("cls")

    print "Digite a data de nascimento (no formato DD/MM/AAAA): #{data_digitada}"
  
    char = STDIN.getch

    break if char == "\r"

    data_digitada += char if char.match?(/\d/)

    data_digitada += "/" if data_digitada.length == 2 || data_digitada.length == 5
  end

  data_digitada.chop! if data_digitada.end_with?("/")

  break if data_digitada.downcase == "exit"

  begin
    data_nascimento = DateTime.strptime(data_digitada, "%d/%m/%Y")

    data_atual = DateTime.now

    idade = ((data_atual - data_nascimento).to_i / 365.25).round

    puts "\nOlá, #{nome}! Você tem #{idade} anos de idade!"
    break  
  rescue ArgumentError
    puts "\nFormato de data inválido. Por favor, insira no formato DD/MM/AAAA."
    puts "\nPressione ENTER para inserir sua data de nascimento."
    gets
  end
end
