#!/bin/bash

# yt-dlp
echo "Installing yt-dlp"
curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o ~/.local/bin/yt-dlp
chmod a+rx ~/.local/bin/yt-dlp  # Make executable

# ollama
echo "Installing ollama"
curl -fsSL https://ollama.com/install.sh | sh
ollama pull llama2-uncensored
ollama pull gemma3:27b
ollama pull gemma3:12b
ollama pull codellama
ollama pull deepseek-coder-v2
ollama pull deepseek-r1:32b
ollama pull deepseek-r1:14b
ollama pull deepseek-r1:7b

# pia
echo "Installing Private Internet Access"
# Get the latest version by scraping the website
PIA_LATEST=$(curl -s https://www.privateinternetaccess.com/download/linux-vpn | grep -oP 'pia-linux-[0-9.-]+\.run' | head -n 1)
curl -L https://installers.privateinternetaccess.com/download/$PIA_LATEST -o /tmp/$PIA_LATEST
chmod a+rx /tmp/$PIA_LATEST # Make executable
/tmp/$PIA_LATEST # run installer

# anaconda
echo "Installing Anaconda"
curl -L https://repo.anaconda.com/archive/Anaconda3-2024.10-1-Linux-x86_64.sh -o /tmp/anaconda3-install.sh
chmod a+rx /tmp/anaconda3-install.sh # Make executable
/tmp/anaconda3-install.sh # run installer