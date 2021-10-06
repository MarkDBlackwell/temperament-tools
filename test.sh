#/bin/sh

cat test/values.scl | ./scaleread | diff - test/fixture/values
