#!/bin/bash

display_message() {
  printf '%s\n' "$1"
}

input_matches_yY() {
  [[ "$1" =~ ^(y|Y) ]]
}
