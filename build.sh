#!/bin/bash

set -e

echo "Starting Flutter Web build..."

# Install Flutter
echo "Installing Flutter..."
git clone https://github.com/flutter/flutter.git -b stable --depth 1 $HOME/flutter
export PATH="$HOME/flutter/bin:$PATH"

# Enable web support
echo "Enabling web support..."
flutter config --enable-web

# Get dependencies
echo "Getting dependencies..."
flutter pub get

# Build for web
echo "Building for web..."
flutter build web --release --web-renderer canvaskit

echo "Build completed successfully!"
