import argparse as arg
import random
import string

def main(sentence, lang):
    if lang == "pt" or lang == "hu":
        print(perturb_latin(sentence))
    elif lang == "ja":
        print(perturb_japanese(sentence))
    elif lang == "en":
        print(sentence)

def perturb_japanese(string):
    new_string = string
    switch = [random.randrange(2), random.randrange(2), random.randrange(2)]
    if switch[0]:
        new_string = ja_me(new_string)
    if switch[1]:
        new_string = ja_ending(new_string)
    if switch[2]:
        new_string = ja_particle(new_string)
    return new_string

def ja_me(string):
    if "私の" in string:
        new_string = string.replace('私の', '')
    elif '私' in string:
        new_string = string.replace('私', '僕')
    else:
        new_string = string

    return new_string

def ja_ending(string):
    if "た。" in string:
        num = random.randrange(2)
        if num == 0:
            new_string = string.replace('た。', 'たの。')
        elif num == 1:
            new_string = string.replace('た。','たんだ。')

    elif "です。" in string:
        new_string = string.replace('です。','。')
    else:
        new_string = string

    return new_string

def ja_particle(string):
    num = random.randrange(3)
    if 'よ。' not in string and 'ね。' not in string:
        if num == 0:
            new_string = string.replace('。','よ。')
        elif num == 1:
            new_string = string.replace('。','ね。')
        elif num == 2:
            new_string = string.replace('。','よね。')
    else:
        new_string = string

    return new_string

def perturb_latin(string):
    words = string.split(" ")
    new_words = []
    for word in words:
        new_word = ""
        case = random.randrange(4)

        if case == 0:
            new_word = word
        elif case == 1:
            new_word = casing(word)
        elif case == 2:
            new_word = insert(word)
        elif case == 3:
            new_word = delete(word)
        elif case == 4:
            new_word = sub(word)
        new_words.append(new_word)

    return ' '.join(new_words)

def casing(word):
    case = random.randrange(3)
    if case == 0:
        new_word = word.upper()
    elif case == 1:
        index = random.randrange(len(word))
        new_word = word[:index] + word[index].upper() + word[index + 1:]
    elif case == 2:
        new_word = word[0].upper() + word[1:]

    return new_word

def insert(word):
    index = random.randrange(len(word))
    new_word = word[:index] + random.choice(string.ascii_letters) + word[index:]
    return new_word

def delete(word):
    index = random.randrange(len(word))
    new_word = word[:index] + word[index+1:]
    return new_word

def sub(word):
    index = random.randrange(len(word))
    new_word = word[:index] + random.choice(string.ascii_letters) + word[index + 1:]
    return str(new_word)


if __name__ == "__main__":
    parser = arg.ArgumentParser()
    parser.add_argument("input", type=str)
    parser.add_argument("lang", type=str)
    args = parser.parse_args()
    main(args.input, args.lang)
