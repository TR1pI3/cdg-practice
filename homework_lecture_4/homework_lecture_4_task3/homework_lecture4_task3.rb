BALANCE_FILE_PATH = 'homework_lecture_4/homework_lecture_4_task3/balance.txt'.freeze
DEFAULT_BALANCE = 100.0

def balance_status
  if File.file?(BALANCE_FILE_PATH) && !File.zero?(BALANCE_FILE_PATH)
    File.read(BALANCE_FILE_PATH)
  else
    DEFAULT_BALANCE
  end
end

def menu
  puts 'Выберите одно из действий:'
  puts 'D(deposit) - добавить деньги на счет'
  puts 'W(withdraw) - снять деньги со счета'
  puts 'B(balance) - посмотреть баланс'
  puts 'Q(quit) - выйти из программы'
end

def handle_input(input)
  case input
  when 'd'
    deposit
  when 'w'
    withdraw
  when 'b'
    balance
  else
    puts 'Введите корректное значение'
  end
  balance_status
end

def deposit
  puts 'Введите сумму для депозита:'
  amount = gets.to_f
  if amount.positive?
    new_balance = balance_status.to_f + amount
    File.write(BALANCE_FILE_PATH, new_balance)
  end
end

def withdraw
  puts 'Введите сумму для вывода средств:'
  amount = gets.to_f
  if amount <= balance_status.to_f
    new_balance = balance_status.to_f - amount
    File.write(BALANCE_FILE_PATH, new_balance)
  else
    puts 'Невозможно выполнить операцию, на вашем балансе недостаточно средств'
  end
end

def balance
  puts "Ваш баланс: #{balance_status}"
end

def init
  loop do
    balance
    menu
    input = gets.chomp.downcase
    break if input == 'q'

    handle_input(input)
  end
end
