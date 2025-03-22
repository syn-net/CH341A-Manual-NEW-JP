#!/usr/bin/env bash
#
#
#

[ -n "$DEBUG" ] && set -o errexit
[ -n "$DEBUG_TRACE" ] && set -o xtrace

GIT_DEST="/mnt/fs1/Projects"
GIT_DIR="CH341A-Manual-NEW-JP.git"

cd "$GIT_DEST" || exit 2

git clone "https://github.com/Keeyees/CH341A-Manual-NEW-JP.git" \
  "$GIT_DIR" || exit 254

cd "$GIT_DIR" || exit 2

PRODUCT_IMAGES=(
  "https://m.media-amazon.com/images/I/61K3+dLe7yL._AC_SL1500_.jpg"
  "https://m.media-amazon.com/images/I/61yHZybsWRS._AC_SL1500_.jpg"
  "https://m.media-amazon.com/images/I/614ko9hVEiL._AC_SL1500_.jpg"
  "https://m.media-amazon.com/images/I/716jQejnqwL._AC_SL1500_.jpg"
)

for url in "${PRODUCT_IMAGES[@]}"; do
  [ -n "$DEBUG" ] && echo $url
  if [ -z "$DRYRUN" ]; then
    wget "$url"
  else
    echo $url
  fi
done

