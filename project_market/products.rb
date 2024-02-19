class Product
    attr_accessor :name, :price, :category, :expiry_date, :amount

    def initialize(name, price, category, expiry_date, amount)
        @name = name
        @price = price
        @category = category
        @expiry_date = expiry_date
        @amount = amount
    end

    def display_info
        currency_symbol = "R$"

        puts "Produto: \t\t#{@name}"
        puts "Preço: \t\t\t#{currency_symbol}#{format('%.2f',@price)}"
        puts "Categoria: \t\t#{@category}"
        puts "Data de validade:\t#{@expiry_date}"
        puts "Quantidade: \t\t#{@amount}"
        puts "------------------------------------"
    end
end

