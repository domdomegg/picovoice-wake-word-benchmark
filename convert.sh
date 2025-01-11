#!/bin/bash

set -euo pipefail

# Create temporary directory
TMP_DIR=$(mktemp -d)
echo "Created temporary directory: $TMP_DIR"

# Clone the original repository
echo "Cloning Picovoice Wake Word Benchmark repository..."
git clone https://github.com/Picovoice/wake-word-benchmark.git "$TMP_DIR/repo"

# Create output directories for each wake word
mkdir -p alexa
mkdir -p computer
mkdir -p jarvis
mkdir -p smart_mirror
mkdir -p snowboy
mkdir -p view_glass

# Function to convert files with standardized settings
convert_files() {
    src_dir=$1
    dst_dir=$2
    
    # Handle both .flac and .wav files
    for file in "$src_dir"/*; do
        if [[ -f "$file" ]]; then
            filename=$(basename "$file")
            filename_noext="${filename%.*}"
            ffmpeg -i "$file" -ar 16000 -ac 1 -sample_fmt s16 -y "$dst_dir/${filename_noext}.wav" -hide_banner -loglevel error
        fi
    done
}

# Convert all datasets using paths from cloned repo
echo "Converting Alexa samples..."
convert_files "$TMP_DIR/repo/audio/alexa" "alexa"

echo "Converting Computer samples..."
convert_files "$TMP_DIR/repo/audio/computer" "computer"

echo "Converting Jarvis samples..."
convert_files "$TMP_DIR/repo/audio/jarvis" "jarvis"

echo "Converting Smart Mirror samples..."
convert_files "$TMP_DIR/repo/audio/smart mirror" "smart_mirror"

echo "Converting Snowboy samples..."
convert_files "$TMP_DIR/repo/audio/snowboy" "snowboy"

echo "Converting View Glass samples..."
convert_files "$TMP_DIR/repo/audio/view glass" "view_glass"

# Clean up
echo "Cleaning up temporary directory..."
rm -rf "$TMP_DIR"

echo "Conversion complete! All files standardized to 16kHz, 16-bit, mono WAV format"
