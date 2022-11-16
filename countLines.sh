#!/usr/bin/env sh
find ./lib -type f -name "*.dart" | xargs -L 1 wc -l | awk '{print $1}' | paste -sd+ - | bc