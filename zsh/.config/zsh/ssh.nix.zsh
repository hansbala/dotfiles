# Configure the systemd SSH agent on Linux.
# macOS manages SSH_AUTH_SOCK via launchd.

case "$(uname -s)" in
  Linux)
    agent_socket="${XDG_RUNTIME_DIR:-}/ssh-agent.socket"

    if [[ -S "$agent_socket" ]] &&
       { [[ -z "${SSH_AUTH_SOCK:-}" ]] || [[ ! -S "$SSH_AUTH_SOCK" ]]; }; then
      export SSH_AUTH_SOCK="$agent_socket"
    fi

    if [[ -S "${SSH_AUTH_SOCK:-}" &&
          -f "$HOME/.ssh/git_personal" ]]; then
      ssh-add -q "$HOME/.ssh/git_personal" 2>/dev/null
    fi
    ;;
esac
