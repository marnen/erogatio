#!/bin/bash

# Launch browser when any file in $1 is created.
fswatch -x $1 | grep --line-buffered -v AttributeModified | awk '{print $1; fflush}' | xargs -n1 open
