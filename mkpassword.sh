function mkpassword() {
  if [[ "$1" == "--help" ]] || [[ "$1" == "-h" ]]; then
    echo "usage: mkpassword [LENGTH=14]"
    return 1
  fi
  local chars="abcdefghjkmnpqrstuvwxyzACDEFGHJKMNPQRSTUVWXYZ2345679"
  local length="${1:-14}"
  local res="$(base64 /dev/urandom | tr -cd "$chars"] | head -c "$length")"
  echo "$res"
}

