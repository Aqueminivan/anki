#!/bin/bash

set -e

antispam=", at the domain "

echo "All contributors:"
git log --pretty=format:' - %ae' CONTRIBUTORS |sort |uniq |sort -f | sed "s/@/$antispam/"

headAuthor=$(git log -1 --pretty=format:'%ae')
authorAt=$(echo "$headAuthor" | sed "s/@/$antispam/")
if git log --pretty=format:'%ae' CONTRIBUTORS | grep -q "$headAuthor"; then
    echo "Author $authorAt found in CONTRIBUTORS"
else
    echo "Author $authorAt NOT found in list"
    exit 1
fi
