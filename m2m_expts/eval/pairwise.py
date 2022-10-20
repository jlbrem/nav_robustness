import argparse
import string
from collections import Counter, defaultdict
from statistics import mean
import sacrebleu

def main(args):
    hyps = open(args.hyps)
    refs = open(args.refs)

    hyps_map = defaultdict()

    for hyp, ref in zip(hyps, refs):

        #clean lines, no punct, all lowercase

        hyp = hyp.rstrip().lower().translate(str.maketrans('','',string.punctuation))
        ref = ref.rstrip().lower().translate(str.maketrans('','',string.punctuation))

        if ref in hyps_map:
            hyps_map[ref].append(hyp)
        else:
            hyps_map[ref] = [hyp]

    print('map made')

    scores = []

    for prompt, hyps in hyps_map.items():
        scores.append(pairwise(hyps))

    print(sum(scores)/len(scores))

def pairwise(hyps):
    scores = []
    for i in range(len(hyps)):
        for j in range(i+1,len(hyps)):
            scores.append(float(sacrebleu.sentence_bleu(hyps[i],[hyps[j]]).score))
    print('prompt done')
    return sum(scores)/len(scores)

if __name__ == "__main__":
    parser=argparse.ArgumentParser()
    parser.add_argument("hyps")
    parser.add_argument("refs")

    args = parser.parse_args()
    main(args)

