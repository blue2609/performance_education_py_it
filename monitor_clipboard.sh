#!/bin/zsh

# Previous clipboard content
previous_content=""


while true; do
    # Get the current clipboard content
    current_content=$(pbpaste)

    # Check if the clipboard content has changed
    if [ "$current_content" != "$previous_content" ]; then
        # Run the Automator Quick Action
        automator -i "$current_content" "/Users/admin/Library/Services/replace_clipboard_on_copy.workflow"

        # Update the previous clipboard content
        previous_content="$current_content"
    fi

    # Wait for a short period before checking again
    sleep 1
done
