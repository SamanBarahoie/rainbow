#!/usr/bin/env bash

# 🌈 Terminal Rainbow Pro
VERSION="1.6"
# Author: saman barahoie

# Check for Bash
if [ -z "$BASH_VERSION" ]; then
  echo "❌ Please run this script with Bash: bash $0 [options]"
  exit 1
fi

# Themes 🎨
declare -A THEMES=(
  ["rainbow"]="31 33 32 36 34 35"
  ["neon"]="35 36 33"
  ["cold"]="34 36 37"
  ["fire"]="31 91 33 93"
  ["ice"]="36 96 97"
  ["pastel"]="95 96 94 92"
  ["matrix"]="32 2"
)

# Defaults
THEME="rainbow"
MODE="char"
PULSE=false
WAVE=false
BOLD=false
OUTPUT_FILE=""
DELAY=0.1

# Usage info 📘
usage() {
  cat << EOF
🌈 Terminal Rainbow Pro v$VERSION

Usage: $0 [options] [text]

Options:
  -t THEME     Color theme (${!THEMES[@]})
  -m MODE      Color mode (char, word, line)
  -p           Pulse animation
  -w           Wave animation
  -b           Bold text
  -o FILE      Save raw input to file
  -v           Show version
  -h           Show help

Examples:
  echo "Hi!" | $0 -t pastel -m word -b
  $0 -t fire -m char -w "Hot stuff 🔥"
EOF
  exit 0
}

# Parse arguments
while getopts "t:m:pwbvo:h" opt; do
  case $opt in
    t) THEME=$OPTARG ;;
    m) MODE=$OPTARG ;;
    p) PULSE=true ;;
    w) WAVE=true ;;
    b) BOLD=true ;;
    o) OUTPUT_FILE=$OPTARG ;;
    v) echo "🌈 Terminal Rainbow Pro v$VERSION"; exit 0 ;;
    h) usage ;;
    *) usage ;;
  esac
done
shift $((OPTIND - 1))

# Input
if [ $# -eq 0 ] && ! [ -p /dev/stdin ]; then
  usage
fi

# Validation
if [[ -z "${THEMES[$THEME]}" ]]; then
  echo "❌ Invalid theme: $THEME. Available: ${!THEMES[@]}"
  exit 1
fi

if [[ ! "$MODE" =~ ^(char|word|line)$ ]]; then
  echo "❌ Invalid mode: $MODE"
  exit 1
fi

if [ "$PULSE" = true ] && [ "$WAVE" = true ]; then
  echo "❌ Cannot use both pulse and wave"
  exit 1
fi

# Input
RAW=()
if [ -p /dev/stdin ]; then
  while IFS= read -r line; do RAW+=("$line"); done
else
  RAW=("$*")
fi

# Helpers
get_color() {
  local colors=(${THEMES[$THEME]})
  local idx=${1:-$((RANDOM % ${#colors[@]}))}
  echo "${colors[$idx]}"
}

format() {
  local code="$1"; local text="$2"
  local prefix="\033[${code}m"
  [ "$BOLD" = true ] && prefix="\033[1;${code}m"
  printf "%b%s\033[0m" "$prefix" "$text"
}

colorize_line() {
  format "$(get_color "$1")" "$2"
}

colorize_word() {
  format "$(get_color "$1")" "$2"
}

colorize_char() {
  format "$(get_color "$1")" "$2"
}

# Animations 🌊
pulse_effect() {
  local txt=""
  for ln in "${RAW[@]}"; do
    if [ "$MODE" = "line" ]; then
      txt+=$(colorize_line "" "$ln")$'\n'
    elif [ "$MODE" = "word" ]; then
      for wd in $ln; do txt+="$(colorize_word "" "$wd") "; done; txt+=$'\n'
    else
      for ((i=0; i<${#ln}; i++)); do txt+="$(colorize_char "" "${ln:i:1}")"; done; txt+=$'\n'
    fi
  done
  for i in {1..2}; do tput clear; printf "\033[1m%s\033[0m" "$txt"; sleep $DELAY
                     tput clear; printf "\033[2m%s\033[0m" "$txt"; sleep $DELAY; done
  tput clear; echo -e "$txt"
}

wave_effect() {
  local colors=(${THEMES[$THEME]})
  local n=${#colors[@]}

  for frame in {0..6}; do
    tput clear
    for ln in "${RAW[@]}"; do
      if [ "$MODE" = "line" ]; then
        echo -e "$(colorize_line $((frame % n)) "$ln")"
      elif [ "$MODE" = "word" ]; then
        local wi=0 out=""
        for wd in $ln; do out+="$(colorize_word $(((frame+wi)%n)) "$wd") "; ((wi++)); done
        echo -e "$out"
      else
        local out=""
        for ((i=0; i<${#ln}; i++)); do
          out+="$(colorize_char $(((frame+i)%n)) "${ln:i:1}")"
        done
        echo -e "$out"
      fi
    done
    sleep $DELAY
  done

  for ln in "${RAW[@]}"; do echo -e "$(colorize_line "" "$ln")"; done
}

# Main 🔥
if [ "$WAVE" = true ]; then
  wave_effect
elif [ "$PULSE" = true ]; then
  pulse_effect
else
  for ln in "${RAW[@]}"; do
    if [ "$MODE" = "line" ]; then
      echo -e "$(colorize_line "" "$ln")"
    elif [ "$MODE" = "word" ]; then
      local out=""
      for wd in $ln; do out+="$(colorize_word "" "$wd") "; done
      echo -e "$out"
    else
      local out=""
      for ((i=0; i<${#ln}; i++)); do
        out+="$(colorize_char "" "${ln:i:1}")"
      done
      echo -e "$out"
    fi
  done
fi

# Save to file
if [ -n "$OUTPUT_FILE" ]; then
  echo "${RAW[@]}" > "$OUTPUT_FILE"
  echo "✅ Raw input saved to $OUTPUT_FILE"
fi
