class CashMachine
  BALANCE_FILE_PATH = 'homework_lecture_5/homework_lecture_5_task1/balance.txt'.freeze
  DEFAULT_BALANCE = 100.0

  def initialize
    @balance = balance_status.to_f
  end

  def update_balance_file
    File.write(BALANCE_FILE_PATH, @balance)
  end

  def balance_status
    if File.file?(BALANCE_FILE_PATH) && !File.zero?(BALANCE_FILE_PATH)
      File.read(BALANCE_FILE_PATH)
    else
      DEFAULT_BALANCE
    end
  end

  def balance
    puts "Ваш баланс: #{@balance}"
  end

  def prompt_amount(operation)
    balance
    puts "Введите сумму для #{operation} или Q для выхода"
    puts 'Ввод:'
    gets.to_f
  end

  def deposit
    amount = prompt_amount('депозита')
    if amount.negative?
      puts 'Невозможно выполнить операцию, сумма депозита не может быть отрицательной!'
    else
      @balance += amount
      update_balance_file
      puts "Ваш новый баланс: #{@balance}"
    end
  end

  def withdraw
    amount = prompt_amount('вывода')
    if amount.negative?
      puts 'Введите корректное значение!'
    elsif amount > @balance
      puts 'Невозможно выполнить операцию, на вашем балансе недостаточно средств!'
    else
      @balance -= amount
      update_balance_file
      puts "Ваш остаток по балансу: #{@balance}"
    end
  end

  def menu
    puts 'Выберите одно из действий:'
    puts 'D(deposit) - добавить деньги на счет'
    puts 'W(withdraw) - снять деньги со счета'
    puts 'B(balance) - посмотреть баланс'
    puts 'Q(quit) - выйти из программы'
  end

  def init
    loop do
      menu
      input = gets.chomp.downcase
      break if input == 'q'

      case input
      when 'd'
        deposit
      when 'w'
        withdraw
      when 'b'
        balance
      else
        puts 'Введите корректное значение!'
      end
    end
  end
end

atm = CashMachine.new
atm.init
