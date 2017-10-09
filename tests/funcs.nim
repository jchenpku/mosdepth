import unittest, mosdepth as mosdepth
import os

suite "mosdepth-suite":
  test "test-quantize-args":

    var rs = get_quantize_args(":1")
    check rs[0] == 0
    check rs[1] == 1

    rs = get_quantize_args("0:1:4:")
    check rs[0] == 0
    check rs[1] == 1
    check rs[2] == 4
    check rs[3] == high(int)

  test "linear-search":

    var bins = @[10, 22, 44, 99]
    var idx: int

    for i, v in bins:
      linear_search(v, bins, idx.addr)
      check idx == i
    linear_search(8, bins, idx.addr)
    check idx == -1

    linear_search(800, bins, idx.addr)
    check idx == -1

    bins = @[0, 1, high(int)]
    linear_search(0, bins, idx.addr)
    check idx == 0
    linear_search(-1, bins, idx.addr)
    check idx == -1

    linear_search(99999, bins, idx.addr)
    check idx == 1
