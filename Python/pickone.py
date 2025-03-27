import random
import sys

# Pick one!
# Syntax: pickone [item1] [item2] [item3]...

args = sys.argv[1:]

print(args[random.randint(0, len(args)-1)])