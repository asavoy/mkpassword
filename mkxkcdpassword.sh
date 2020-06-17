function mkxkcdpassword() {
  if [[ "$1" == "--help" ]] || [[ "$1" == "-h" ]]; then
    echo "usage: mkxkcdpassword [NUM_WORDS=5]"
    return 1
  fi
  local word_list_path=/usr/share/dict/words
  local word_list_filter='^.{2,9}$'
  local total_word_count="$(grep -c -E "$word_list_filter" $word_list_path | tr -s ' ' | cut -d' ' -f 2)" 
  local word_count="${1:-5}"
  local res=""
  for ((i = 0 ; i < word_count ; i++)); do
    local random16=$RANDOM
    local random32=$((RANDOM * random16))
    local word_index=$((random32 % total_word_count))
    local word="$(grep -E "$word_list_filter" $word_list_path | head -n "$word_index" | tail -n 1)"
    if [[ "$res" == "" ]]; then
      res="$word"
    else
      res="$res $word"
    fi
  done
  echo "$res" | tr "[:upper:]" "[:lower:]"
}

