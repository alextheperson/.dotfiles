#!/bin/sh
user="$(whoami)"
hostname="$(hostname)"

echo "{\"text\": \"$user<span color=\\\"#CAD3F5\\\">@</span>$hostname\", \"tooltip\": \"$user@$hostname\", \"class\": \"whoami\"}"
