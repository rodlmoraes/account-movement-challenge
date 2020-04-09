# Questão 1

# birth_date is a dd/mm/aaaa string
def choose_room(birth_date)
    splitted_date = birth_date.split('/')

    birth_day = splitted_date[0].to_i
    birth_month = splitted_date[1].to_i
    birth_year = splitted_date[2].to_i

    today = Time.now

    year_diff = today.year - birth_year
    month_diff = today.month - birth_month
    day_diff = today.day - birth_day

    if year_diff < 0
        'invalid birth_date'
    elsif year_diff > 65 
        'sala 4'
    elsif year_diff > 45 || year_diff == 45 && month_diff > 1 || year_diff == 45 && month_diff == 1 && day_diff > 0 
        'sala 3'
    elsif  year_diff > 25 || year_diff == 25 && month_diff > 2 || year_diff == 25 && month_diff == 2 && day_diff > 15  
        'sala 2'
    else 
        'sala 1'
    end
end

# Questão 2

def esoteric_cetic_or_prime(number)
    response = []
    
    if is_esoteric(number)
        response.push('esoteric')
    else
        response.push('cetic')
        response.push('prime') if is_prime(number)
    end

    response
end

def is_esoteric(number)
    number % 3 == 0 && number % 5 == 0
end

def is_prime(number)
    number = number.abs
    for divisor in (2...number).to_a
        return false if number % divisor == 0
    end
    true
end

# Questão 3

# Afirmações
# · Algumas pessoas são inescrupulosas
# · Os inescrupulosos são sempre amarelos ou verdes
# · Todo nervoso é vermelho
# · As baleias são verdes
# · Os rinocerontes são amarelos
# · Todas as pessoas são nervosas

# Minhas respostas
# (F) Todas as pessoas nervosas são inescrupulosas
# (V) Se uma pessoa é verde ou amarela então ela é inescrupulosa
# (F) As baleias são inescrupulosas
# (F) Todas as pessoas são vermelhas
# (F) Os inescrupulosos são sempre pessoas ou baleias ou rinocerontes
# (V) Se uma pessoa é inescrupulosa então ela é verde ou amarela
# (V) Se algo é azul ou preto então este algo não é baleia, nem é nervoso e nem é rinoceronte