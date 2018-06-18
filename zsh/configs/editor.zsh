if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
  export VISUAL="nvr -cc vsplit --remote-wait +'set bufhidden=wipe'"
else
  export VISUAL="nvim"
fi
export EDITOR=$VISUAL
