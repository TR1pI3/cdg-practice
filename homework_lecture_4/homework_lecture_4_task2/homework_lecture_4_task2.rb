STUDENTS_LIST_PATH = 'names.txt'
STUDENTS_RESULT_LIST_PATH = 'result.txt'

def index
  File.foreach(STUDENTS_RESULT_LIST_PATH) do |student|
    puts student
  end
end

def student_list
  students = []
  File.open(STUDENTS_LIST_PATH, 'r') do |file|
    file.each_line do |line|
      name, surname, age = line.split
      age = age.to_i
      students << { name: name, surname: surname, age: age }
    end
  end
  students
end

def student_result_list
  students_result = []
  File.open(STUDENTS_RESULT_LIST_PATH, 'r') do |file|
    file.each_line do |line|
      name, surname, age = line.split
      age = age.to_i
      students_result << { name: name, surname: surname, age: age }
    end
  end
  students_result
end

def main
  loop do
    puts 'Введите возраст для сортировки: '
    user_input = gets.chomp.to_s
    break if student_result_list.length == student_list.length || user_input == '-1'

    file = File.open(STUDENTS_RESULT_LIST_PATH, 'a')
    File.foreach(STUDENTS_LIST_PATH) do |student|
      file.puts(student) if student.include?(user_input)
    end
    file.close
  end
end
