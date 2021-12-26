#!/bin/bash

FEATURES_DIR="features"
TOKENS_DIR="concord_ui/token_library"

# -----
echo "Generating features freezed files"
cd $FEATURES_DIR

for directory in *; do
    if [ -d "$directory" ]; then
        cd "$directory"
        flutter pub run build_runner build --delete-conflicting-outputs
    fi
done

# -----
echo "Generating tokens freezed files"
cd $TOKENS_DIR

for directory in *; do
    if [ -d "$directory" ]; then
        cd "$directory"
        flutter pub run build_runner build --delete-conflicting-outputs
    fi
done
