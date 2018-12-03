#!/bin/bash

# ps aux | awk '/rust/ {print $2, $11}'
# ps aux | awk '/rust/ {print $2, $11}'

pgrep rust | xargs sudo kill -9
