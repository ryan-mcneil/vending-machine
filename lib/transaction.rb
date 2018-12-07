require './lib/vending_machine.rb'

class Transaction

  def initialize()
    @vending_machine = VendingMachine.new('tiny_vending_machine.json')
    @total_inserted = 0
    @denominations = [1, 5, 10, 25]
  end

  def begin
    request_input
  end

  private

  def request_input
    loop do
      print_menu

      input = gets.chomp.downcase
      case input
      when 'c'
        @vending_machine.print_contents
      when 'i'
        insert_money
      when 'v'

      when 'p'
        break if purchase
      end
    end
  end

  def print_menu
    puts "Hello, please enter a command"
    puts "(c)ontents - Prints the contents of the vending machine."
    puts "(i)nsert money - Takes in coins and prints total money inserted."
    puts "(v)alid coin values - Prints the valid coins inputs:  Accepts coins of 1,5,10,25 Cents i.e. penny, nickel, dime, and quarter."
    puts "(p)urchase - Displays a prompt to enter the slot they'd like to purchase."
  end

  def insert_money
    puts "Please insert your money"
    input = gets.chomp.to_i
    if @denominations.include?(input)
      @total_inserted += input
      puts "Total Inserted: #{@total_inserted}"
    else
      puts "Not a valid coin"
    end
  end

  def purchase

    true
  end

end

Transaction.new.begin
