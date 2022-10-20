import argparse
import string
from collections import Counter, defaultdict
from statistics import mean

def main(args):
    hyps = open(args.hyps)
    refs = open(args.refs)

    hyps_map = defaultdict()
    refs_counter = Counter()


    for hyp, ref in zip(hyps, refs):

        #clean lines, no punct, all lowercase

        hyp = hyp.rstrip().lower().translate(str.maketrans('','',string.punctuation))
        ref = ref.rstrip().lower().translate(str.maketrans('','',string.punctuation))

        refs_counter[ref] += 1

        if ref not in hyps_map:
            hyps_map[ref] = Counter()

        hyps_map[ref][hyp] += 1

    print(score_model(hyps_map))
    print(exact_match(hyps_map))
    print(num_clusters(hyps_map))
    return

def score_model(hyps):
    scores = []
    for cluster in hyps.values():
        scores.append(score_cluster(cluster))

    return mean(scores)

def score_cluster(counts):
    total = sum(counts.values())
    rank = 1
    score = 0

    for num in counts.values():
        score = score + ((float(num)/total)*(1.0/rank))
        rank += 1

    return score

def exact_match(hyps):
    scores = []
    for ref, cluster in hyps.items():
        scores.append(score_match(ref, cluster))
    return mean(scores)

def score_match(ref, counts):
    total = sum(counts.values())
    return float(counts[ref])/total

def num_clusters(hyps):
    scores = []
    for ref, cluster in hyps.items():
        scores.append(len(cluster))
    return mean(scores)
    

if __name__ == "__main__":
    parser=argparse.ArgumentParser()
    parser.add_argument("hyps")
    parser.add_argument("refs")

    args = parser.parse_args()
    main(args)
    


