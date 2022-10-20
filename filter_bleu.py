import argparse as arg

def main(args):
    with open(args.gold) as goldf, open(args.hyps) as hypsf:
        stored_ref = ""
        for ref, hyp in zip(goldf, hypsf):
            ref = ref.strip()
            hyp = hyp.strip()
            if ref != stored_ref:
                if args.print_gold:
                    print(ref)
                else:
                    print(hyp)
            stored_ref = ref


if __name__ == "__main__":
    parser = arg.ArgumentParser()
    parser.add_argument("gold", type=str)
    parser.add_argument("hyps", type=str)
    parser.add_argument("--print_gold", "-g", action='store_true')
    args = parser.parse_args()
    main(args)