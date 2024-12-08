#!/bin/bash

# yt-dlp
curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o ~/.local/bin/yt-dlp
chmod a+rx ~/.local/bin/yt-dlp  # Make executable

# ollama
curl -fsSL https://ollama.com/install.sh | sh
ollama pull llama2-uncensored
ollama pull codellama
ollama pull llama3.2

# pia
wget -O /tmp/pia-linux.run https://installers.privateinternetaccess.com/download/pia-linux-3.6.1-08339.run
chmod a+rx /tmp/pia-linux.run
./tmp/pia-linux.run # run installer

# Haskell (manual input required)
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh