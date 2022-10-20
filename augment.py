import argparse as arg
import random
import string
import perturb

def main(args):
    lang = args.lang
    input = args.input
    with open(input, 'r') as f:
        for line in f:
            line = line.strip()
            print(line)
            for i in range(9):

                if lang == "en":
                    print(line)
                elif lang == "pt" or lang == "hu":
                    perturb.main(line, lang)
                elif lang == "ja":
                    perturb.main(line, lang)

if __name__ == "__main__":
    parser = arg.ArgumentParser()
    parser.add_argument("input", type=str)
    parser.add_argument("lang", type=str)
    args = parser.parse_args()
    main(args)
