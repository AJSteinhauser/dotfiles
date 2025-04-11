#!/bin/bash

# Function to rename tmux windows
update_tmux_window_names() {
  # Loop through all tmux sessions and windows
  tmux list-windows -a -F "#{session_name}:#{window_index}:#{pane_current_path}" | while IFS=: read -r session window path; do
    # Check if the path exists (to avoid errors)
    if [ -d "$path" ]; then
      # Get the base directory name
      dir_name=$(basename "$path")

      # Get the current Git branch (if any)
      git_branch=$(git -C "$path" rev-parse --abbrev-ref HEAD 2>/dev/null || echo "")

      # Construct the new window name
      if [ -n "$git_branch" ]; then
        new_name="${dir_name} | ${git_branch}"
      else
        new_name="${dir_name}"
      fi

      # Rename the tmux window
      tmux rename-window -t "${session}:${window}" "$new_name"
    fi
  done
}

# Call the function
update_tmux_window_names
