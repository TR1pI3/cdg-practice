def greeting(first_name, last_name, age)
  full_name = "#{first_name} #{last_name}"
  if age < 18
    "Привет #{full_name}. Тебе меньше 18 лет, но начать учиться программировать никогда не рано."
  else
    "Привет #{full_name}. Самое время заняться делом!"
  end
end

def foobar(foo, bar)
  (foo === 20 || bar === 20) ? bar : foo + bar
end
