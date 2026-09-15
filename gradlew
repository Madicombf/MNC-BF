#!/bin/sh
set -eu
APP_HOME=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
GRADLE_VERSION=9.6.0
CACHE_ROOT="${GRADLE_USER_HOME:-$HOME/.gradle}/mnc-bf-distributions"
GRADLE_HOME="$CACHE_ROOT/gradle-$GRADLE_VERSION"
ZIP="$CACHE_ROOT/gradle-$GRADLE_VERSION-bin.zip"

if [ ! -x "$GRADLE_HOME/bin/gradle" ]; then
  mkdir -p "$CACHE_ROOT"
  echo "Installation locale de Gradle $GRADLE_VERSION..."
  if command -v curl >/dev/null 2>&1; then
    curl -fL "https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip" -o "$ZIP"
  elif command -v wget >/dev/null 2>&1; then
    wget -O "$ZIP" "https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip"
  else
    echo "curl ou wget est requis pour le premier lancement."
    exit 1
  fi
  unzip -q -o "$ZIP" -d "$CACHE_ROOT"
fi

exec "$GRADLE_HOME/bin/gradle" -p "$APP_HOME" "$@"
