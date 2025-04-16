#!/bin/bash

# Init vars
ARGS=()

if [ -z "${BACKSTESTER}" ]; then
  ARGS+=("src/main.py")
else
  echo "Run with Backtester mode"
  ARGS+=("src/backtester.py")
fi

# Check if GROQ_API_KEY is set and not empty
if [ -z "${GROQ_API_KEY}" ]; then
  echo "Error: GROQ_API_KEY environment variable is not set or is empty." >&amp;2
  exit 1
fi

# Check if TICKER is set and not empty
if [ -z "${TICKER}" ]; then
  echo "Error: TICKER environment variable is not set or is empty." >&amp;2
  exit 1
else
  ARGS+=("--ticker" "${TICKER}")
fi

# Check if SHOW_REASONING is set and not empty
if [ -z "${SHOW_REASONING}" ]; then
  echo "Error: SHOW_REASONING environment variable is not set or is empty." >&amp;2
  exit 1
else
  ARGS+=("--show-reasoning")
fi

# Check if START_DATE & END_DATE are set and not empty
if [ -z "${START_DATE}" || -z "${END_DATE}" ]; then
  echo "Error: SHOW_REASONING environment variable is not set or is empty." >&amp;2
else
  echo "Start & end dates are provided"
  ARGS+=("--start-date" "${START_DATE}" "--end-date" "${END_DATE}")
fi

echo poetry run python "${ARGS[@]}"