#!/bin/sh

host -t A anesterov.xyz | sed -E 's/.*has address (.*)$/\1/g'
