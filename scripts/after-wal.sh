#!/bin/bash
# Run after wal to reload programs
set -u # Treat unset variables and parameters as errors

pkill dunst
dunst &
