require 'csv'
todos = []

def print_menu
    puts "What do you want to do?\n"
    puts "[S]ee all TODOs"
    puts "[A]dd a TODO"
    puts "[R]emove a TODO"
    puts "[D]ownload TODOs as CSV"
    puts "[E]xit"
end

def process_user_choice(choice, todos)
    case choice
    when "s"
        print_selected_option("See all TODOs")
        see_all_todos(todos)
    when "a"
        print_selected_option("Add a TODO")
        add_todo(todos)
    when "r"
        print_selected_option("Remove a TODO")
        remove_todo(todos)
    when "d"
        print_selected_option("Download TODOs as CSV")
        download_csv(todos)
    when "e"
        print_selected_option("Exit")
        puts "Press any key to close."
        gets.chomp
    end
end

def download_csv(todos)
    if todos.empty?
        puts "No TODOs to export, please add a TODO before download as a CSV"
    else
        puts "Enter the CSV file name (without extension):"
        file_name = gets.chomp
        csv_file = "#{file_name}.csv"

        ::CSV.open(csv_file, 'w') do |csv|
            todos.each { |todo| csv << [todo] }
        end
        
        puts "TODOs successfully exported to #{csv_file}\n"
    end
end

def print_selected_option(selected_option)
    puts "Selected option: #{selected_option}\n"
end

def see_all_todos(todos)
    if todos.empty?
        puts "No TODOs have been added yet."
        puts "Please add a TODO before checking all TODOs."
    else
        puts "List of all TODOs:\n"
        todos.each_with_index { |todo, index| puts "#{index + 1} #{todo}"}
    end
    puts
end

def add_todo(todos)
    puts "Enter the TODO description:"
    new_todo = gets.chomp

    if new_todo.strip.empty?
        puts "The description cannot be empty.\n"
    elsif todos.include?(new_todo)
        puts "Your already have this on the list.\n"
    else
        todos << new_todo
        puts "TODO successfully added: #{new_todo}\n"
    end
end

def remove_todo(todos)
    if todos.empty?
        puts "No TODOs have been added yet."
        return
    else
        puts "Select the index of the TODO you want to remove:\n"
        todos.each_with_index { |todo, index| puts "#{index + 1}. #{todo}" }
    end
    puts

    input = gets.chomp

    if input.match?(/\A\d+\z/) && (index = input.to_i - 1).between?(0, todos.length - 1)
        removed_todo = todos.delete_at(index)
        puts "TODO removed: #{removed_todo}\n"
    else
        puts "The given index is not valid.\n"
    end
end 

puts "Hello!"

loop do
    print_menu
    user_choice = gets.chomp.downcase
    system("clear") || system("cls")

    valid_choices = ["s", "a", "r", "d", "e"]

    if valid_choices.include?(user_choice)
        process_user_choice(user_choice, todos)
    else
        puts "Invalid choice! Please input a valid choice:\n"
    end

    break if user_choice == "e"
end