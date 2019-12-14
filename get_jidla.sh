#!/bin/bash

[[ -z "$1" ]] && echo "missing \$1 filter param" && exit 2

for commit in $(git log --format=format:%H -- plugins/InputVar/InputVar.xml); do
  cdate="$(git --no-pager show --no-patch --no-notes --date=format:'%Y-%m-%d' --pretty='%cd' "$commit")"
  while read -r line; do
    txt="$(echo "$line" | hxselect -c "var")"
    [[ -z "$txt" ]] && continue
    echo
    echo -n "$cdate;$txt"
  done < <(git show "$commit:plugins/InputVar/InputVar.xml" | hxselect -s '\n' "var[id='$1']" | sed ':a;N;$!ba;s/&#13;\n/;/g')
done
