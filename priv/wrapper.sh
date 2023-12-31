#!/usr/bin/env bash

# https://hexdocs.pm/elixir/main/Port.html#module-zombie-operating-system-processes
# Wrapper script for running local commands supervised by Elixir (to ensure killed on BEAM exit)

# Start the program in the background
exec "$@" &
pid1=$!

# Silence warnings from here on
exec >/dev/null 2>&1

# Read from stdin in the background and
# kill running program when stdin closes
exec 0<&0 $(
  while read; do :; done
  kill -KILL $pid1
) &
pid2=$!

# Clean up
wait $pid1
ret=$?
kill -KILL $pid2
exit $ret
