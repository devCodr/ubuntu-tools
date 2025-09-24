#!/bin/bash
active=$(xdotool getactivewindow)

case $1 in
  d)
    xdotool windowmove $active 0 0
    xdotool windowsize $active 1920 1080
    ;;
  t)
    xdotool windowmove $active 100 100
    xdotool windowsize $active 768 1024
    ;;
  m)
    xdotool windowmove $active 200 200
    xdotool windowsize $active 1080 768
    ;;
  *)
    echo "Usage: $0 {d|t|m}"
    exit 1
    ;;
esac