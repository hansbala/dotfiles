# unlocks the vault and returns the session key which is needed to perform actions such as list and get
function bw_get_session_key() {
  session_key=$(bw unlock --passwordenv BW_PASSWORD 2>/dev/null | awk -F '"' '/BW_SESSION/ {print $2}' | tail -n 1)
  echo $session_key
}

# helper function that logs in, sets the session key, and fetches the password for a specific id
function bw_get_password_for_id() {
  bw login --apikey &>/dev/null
  session_key=$(bw_get_session_key)
  export BW_SESSION=$session_key
  bw get password $1 | pbcopy
}

# gets the glean password
function bw_get_password_glean_google() {
  bw_get_password_for_id d2eeaecf-6009-47e5-9842-aec1000e19bd
}

