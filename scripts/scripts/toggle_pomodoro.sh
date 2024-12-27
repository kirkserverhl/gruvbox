#!/bin/bash

# Variables
APP="pomodorolm"
FLOAT_WINDOW_TITLE="Pomodoro"

# Check if the Pomodoro process is already running
POMODORO_PID=$(pgrep -u "$USER" -f "$APP")

if [[ -n "$POMODORO_PID" ]]; then
    # If the process is running, find and close the window
    WINDOW_ID=$(xdotool search --name "$FLOAT_WINDOW_TITLE")
    if [[ -n "$WINDOW_ID" ]]; then
        xdotool windowunmap "$WINDOW_ID"
    fi
else
    # Launch the Pomodoro app as a standalone GUI
    "$APP" &
fi

