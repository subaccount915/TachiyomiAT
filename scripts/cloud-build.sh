#!/usr/bin/env bash
set -euo pipefail

# Usage:
#   scripts/cloud-build.sh :app:compileStandardDebugKotlin
#   scripts/cloud-build.sh :app:compileStandardDebugKotlin :domain:compileKotlin

if [[ $# -eq 0 ]]; then
  echo "Usage: $0 <gradle_task...>"
  exit 1
fi

find_jdk21() {
  local candidates=(
    "${HOME}/.local/share/mise/installs/java/21"
    "${HOME}/.local/share/mise/installs/java/21.0.2"
    "/usr/lib/jvm/temurin-21-jdk-amd64"
    "/usr/lib/jvm/java-21-openjdk-amd64"
    "/usr/lib/jvm/java-21-openjdk"
  )
  for jdk in "${candidates[@]}"; do
    if [[ -x "$jdk/bin/java" ]]; then
      echo "$jdk"
      return 0
    fi
  done
  return 1
}

if [[ -z "${JAVA_HOME:-}" ]] || [[ ! -x "${JAVA_HOME}/bin/java" ]] || ! "${JAVA_HOME}/bin/java" -version 2>&1 | head -n1 | grep -q '"21\.'; then
  if JDK21_HOME="$(find_jdk21)"; then
    export JAVA_HOME="$JDK21_HOME"
  else
    echo "JDK 21 not found. Install JDK 21 in cloud runner first."
    exit 1
  fi
fi

unset JAVA_VERSION || true
export PATH="${JAVA_HOME}/bin:${PATH}"

echo "Using JAVA_HOME=$JAVA_HOME"
java -version

./gradlew "$@"
