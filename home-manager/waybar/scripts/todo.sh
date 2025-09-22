#!/bin/sh

todoText="$(
  cd ~
  todo list | sed ':a;N;$!ba;s/\n/\\n/g' | sed 's#"#\\"#g'
  # That sed converts newlines to \n. I have no idea how
)"

echo "{\"text\": \"$todoText\", \"class\": \"todo\"}"
