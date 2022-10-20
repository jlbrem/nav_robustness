import argparse as arg
import sentencepiece as spm
import os

def main(args):
    data = args.data_path
    name = args.name

    spm.SentencePieceTrainer.train(input=data, model_prefix=name, vocab_size=8000)


if __name__ == "__main__":
    parser = arg.ArgumentParser()
    parser.add_argument("data_path")
    parser.add_argument("name")
    args = parser.parse_args()
    main(args)


