if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

# HomeBrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
