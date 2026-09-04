#!/usr/bin/env bash

# Create a new window named "reports"
tmux new-window \
    -n "reports" \
    -c "$HOME/projects/reports/dentira-reports-job"

# Pane 1 is the initial pane.
# Split right 40% -> creates pane 2
tmux split-window -h -p 40 \
    -c "$HOME/projects/reports/dentira-reports-ui"

# Current pane is the right 40%.
# Split it into:
#   top    20%
#   bottom 80%
#
# -p 80 means the new bottom pane gets 80%.
tmux split-window -v -p 80 \
    -c "$HOME/projects/reports/dentira-reports-job"

# Move back to the top 20% pane
tmux select-pane -U

# Split top 20% into 50/50 -> panes 2 and 3
tmux split-window -h -p 50 \
    -c "$HOME/projects/reports/dentira-reports-api"

# Select pane 1 (left/main)
tmux select-pane -L
