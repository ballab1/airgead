#!/bin/bash

if [ "$#" -gt 0 ]; then

#SED:
# d: Delete pattern space. Start next cycle
# D: Delete up to the first embedded newline in the pattern space. Start next cycle, but skip reading from the input if there is still data in the pattern space.
# G: Append hold space to pattern space.
# g: Copy hold space to pattern space.
# H: Append pattern space to hold space.
# h: Copy pattern space to hold space.
# N: Append the next line of input into the pattern space.
# n: Read the next line of input into the pattern space.
# p: Print the current pattern space.
# P: Print up to the first embedded newline of the current pattern space.
# s/regexp/replacement/ : Attempt to match regexp against the pattern space. If successful, replace that portion matched with replacement. The replacement may contain the special character & to refer to that portion of the pattern space which matched, and the special escapes \1 through \9 to refer to the corresponding matching sub-expressions in the regexp.
# w filename: Write the current pattern space to filename.
# W filename: Write the first line of the current pattern space to filename. This is a GNU extension.
# x: Exchange the contents of the hold and pattern spaces.
# y/source/dest/ : Transliterate the characters in the pattern space which appear in source to the corresponding character in dest.

  set -x
  jq '.Accounts[1:3]' new-json/money.20231231T1333.json | sed -e '{
    N
    s|\([^\}]\),\n    "|\1, "|
  }'
  exit
fi

declare dt jqcmd fname dir='new-json' src='money.new.all.json' tmp='/tmp/tmp'

[ -d "$dir" ] && rm -rf "$dir"
mkdir -p "$dir"

declare -i i="$(jq 'length' "$src")"
while [ $(( --i )) -ge 0 ];do
  jqcmd='.['"$i"']'
  jq "$jqcmd" -S "$src" > "$tmp"
  dt="$(jq -r '."0-date_time"' "$tmp")"
  fname="$dir/money.${dt:0:13}.json"
  sed -i -e 's|"[0-9]-\(.*\)"|"\1"|' "$tmp"
  sed -i -e '/,$/ {
  N
  s|\([^\}]\),\n      "|\1, "|
  }' "$tmp"
  mv "$tmp" "$fname"
  echo "$(( i )): $fname"
done