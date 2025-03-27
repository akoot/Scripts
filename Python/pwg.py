import random

# Password generator

def get_list(a, b):
    return list(range(a, b + 1))

special_chars = get_list(33, 47)
special_chars.extend(get_list(58, 64))
special_chars.extend(get_list(91, 96))
special_chars.extend(get_list(123, 126))

lowercase_chars = get_list(97, 122)
uppercase_chars = get_list(65, 90)
number_chars = get_list(48, 57)

def get_random_char(list):
    size = len(list)
    return chr(list[random.randint(0, size - 1)])


def generate_password(length, uppercase:bool=True, numbers:bool=True, special:bool=True):

    password = []
    for _ in range(length):
        rng = random.random()
        if uppercase and rng < .5:
            password.append(get_random_char(uppercase_chars))
        if numbers and rng < .5:
            password.append(get_random_char(number_chars))
        if special and rng < .5:
            password.append(get_random_char(special_chars))
        else:
            password.append(get_random_char(lowercase_chars))
    return password

print("".join(generate_password(10)))
    