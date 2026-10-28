# Printed by Starship as "profile 12m4s" or "profile X".
# Runs inside the shell Starship already starts. Do not source this from zshrc.
emulate -L zsh

profile=${AWS_PROFILE:-}
[[ -n $profile ]] || exit 1

zmodload zsh/datetime
zmodload zsh/stat

config=${AWS_CONFIG_FILE:-$HOME/.aws/config}
cache_dir=${AWS_LOGIN_CACHE_DIRECTORY:-$HOME/.aws/login/cache}
state_dir=${XDG_CACHE_HOME:-$HOME/.cache}/aws-login-prompt
[[ -d $state_dir ]] || mkdir -p -- $state_dir

show() {
  print -r -- "$profile $1"
  exit 0
}

typeset -A cfg
current=
while IFS= read -r line || [[ -n $line ]]; do
  [[ $line == \#* || $line == '' ]] && continue
  if [[ $line == '[profile '*']' ]]; then
    current=${line#'[profile '}
    current=${current%']'}
    continue
  fi
  if [[ $line == '[default]' ]]; then
    current=default
    continue
  fi
  [[ -z $current || $line != *=* ]] && continue
  key=${line%%=*}
  value=${line#*=}
  key=${key//[[:space:]]/}
  value=${value#"${value%%[![:space:]]*}"}
  value=${value%"${value##*[![:space:]]}"}
  cfg[$current,$key]=$value
done < $config

resolve() {
  local name=$1 seen=
  while [[ -n $name && $seen != *"|$name|"* ]]; do
    seen+="|$name|"
    if [[ -n ${cfg[$name,login_session]:-} ]]; then
      print -r -- ${cfg[$name,login_session]}
      return 0
    fi
    local proc=${cfg[$name,credential_process]:-}
    if [[ $proc == *'--profile '* ]]; then
      name=${proc##*--profile }
      name=${name%% *}
      continue
    fi
    name=${cfg[$name,source_profile]:-}
  done
  return 1
}

stat -A config_mtime -F '%s' +mtime -- $config || show X
state=$state_dir/$profile
json=
if [[ -f $state ]]; then
  {
    IFS= read -r saved_mtime
    IFS= read -r json
  } < $state
  [[ $saved_mtime == $config_mtime ]] || json=
fi

if [[ -z $json ]]; then
  arn=$(resolve $profile) || show X
  hash=$(printf '%s' "$arn" | /usr/bin/shasum -a 256) || show X
  hash=${hash%% *}
  json=$cache_dir/$hash.json
  print -r -- "$config_mtime"$'\n'"$json" > $state
fi

[[ -f $json ]] || show X
expires=$(/usr/bin/jq -er '.accessToken.expiresAt' "$json") || show X
epoch=$(TZ=UTC strftime -r '%Y-%m-%dT%H:%M:%SZ' "$expires") || show X
remaining=$(( epoch - EPOCHSECONDS ))
(( remaining > 0 )) || show X

hours=$(( remaining / 3600 ))
minutes=$(( (remaining % 3600) / 60 ))
seconds=$(( remaining % 60 ))
if (( hours > 0 )); then
  show "${hours}h${minutes}m"
elif (( minutes > 0 )); then
  show "${minutes}m${seconds}s"
else
  show "${seconds}s"
fi
