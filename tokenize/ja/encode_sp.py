import argparse as arg
import sentencepiece as spm
import os

def main(args):
    data = args.data_path
    model = args.name + ".model"
    sp = spm.SentencePieceProcessor(model_file=model)

    with open(data, 'r') as f:
        for line in f:
            print(' '.join(sp.encode(line, out_type=str)))

if __name__ == "__main__":
    parser = arg.ArgumentParser()
    parser.add_argument("data_path")
    parser.add_argument("name")
    args = parser.parse_args()
    main(args)


