#/bin/bash
git log --pretty=format:"* [\`%h\`](/mozillareality/firefoxreality/commit/%h) %s" $1...$2 | sed 's/#\([[:digit:]]*\)/[#\1](\/mozillareality\/firefoxreality\/pull\/\1)/g'
