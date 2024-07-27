import io
import sys

from atcoder.dsu import DSU

_INPUT = """\
5
"""
sys.stdin = io.StringIO(_INPUT)
# ---------------------------------------------------------
n = int(input())
dsu = DSU(n)
print(dsu.groups())
