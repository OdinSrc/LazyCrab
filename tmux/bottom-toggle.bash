#!/bin/bash

zoom_mode_out=$(tmux list-panes -F '#F')
was_zoomed_in=false
if [[ $zoom_mode_out == *"Z"* ]]; then
    # in Zoom mode
    tmux resize-pane -Z
    was_zoomed_in=true
fi

# tmux resize-pane -Z

pane_below=$(tmux display -p -t '{down-of}' '#{pane_index}')

if [ -n "$pane_below" ]; then
    # echo "The pane below is $pane_below"
    tmux select-pane -t 1
    
    if [ "$was_zoomed_in" = true ]; then
        tmux select-pane -t $pane_below
    else
        tmux resize-pane -Z
    fi
else
    tmux split-window -v -c "#{pane_current_path}" -p 20
    pane_below=$(tmux display -p -t '{down-of}' '#{pane_index}')
    tmux select-pane -t $pane_below
fi


