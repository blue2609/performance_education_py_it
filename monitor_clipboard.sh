#!/bin/zsh

# Previous clipboard content
previous_content=""
source ".env"

while true; do
    # Get the current clipboard content
    current_content=$(pbpaste)

    # Check if the clipboard content has changed
    if [ "$current_content" != "$previous_content" ]; then
        # Run the Automator Quick Action
        automator -i "$current_content" "$AUTOMATOR_WORKFLOW_PATH" 

        # Update the previous clipboard content
        previous_content="$current_content"
    fi

    # Wait for a short period before checking again
    sleep 1
done
