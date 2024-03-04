def exponentiation_or_revert(word)
  if word.downcase.end_with?('cs')
    2**word.length
  else
    word.reverse
  end
end

def add_pokemon
  array = []
  puts 'Сколько добавить покемонов?'
  user_input_count = gets.to_i
  user_input_count.times do
    puts 'Какое имя у покемона?'
    user_input_pokemon_name = gets.chomp
    puts 'Какого цвета покемон?'
    user_input_color = gets.chomp
    array << { name: user_input_pokemon_name, color: user_input_color }
  end
  array
end
