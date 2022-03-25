#/bin/sh

# Process all these:
#    2    2/   2/3  2.   2.3  -2    -2/   -2/3  -2.   -2.3  2//3  2/.3  2..3  2./3  -2//3  -2/.3  -2..3  -2./3  2-3  2.-3

# The result should be:
#    2/1  2/1  2/3  2.0  2.3  -2/1  -2/1  -2/3  -2.0  -2.3  2/1   2/1   2.0   2.0   -2/1   -2/1   -2.0   -2.0   2/1  2.0

cat test/values.scl | ./scalereadruby | diff test/fixture/values -
