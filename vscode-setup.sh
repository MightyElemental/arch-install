#!/bin/bash

# Tools
code --install-extension mads-hartmann.bash-ide-vscode # Bash IDE
code --install-extension DanielSanMedium.dscodegpt # CodeGPT
code --install-extension eamodio.gitlens # Git Lens
code --install-extension mhutchie.git-graph # Git Graph
code --install-extension esbenp.prettier-vscode # Prettier VSCode
code --install-extension vscode-icons-team.vscode-icons # VSCode Icons

# Languages
code --install-extension ms-python.python # Python
code --install-extension ms-python.debugpy # Python Debug
code --install-extension ms-python.anaconda-extension-pack # Anaconda
code --install-extension ms-python.pylint # Python Linter
code --install-extension ms-toolsai.jupyter # Python Jupyter
code --install-extension ms-pyright.pyright # Python Static Type Checker
code --install-extension haskell.haskell # Haskell
code --install-extension justusadam.language-haskell # Haskell Syntax Highlighting
code --install-extension redhat.java # Java
code --install-extension redhat.vscode-yaml # YAML
code --install-extension redhat.vscode-xml # XML
code --install-extension mechatroner.rainbow-csv # CSV
code --install-extension llvm-vs-code-extensions.vscode-clangd # C/C++

# Jupyter may not work correctly in the opensource version of code. To fix this:
# Insert "enable-proposed-api": ["ms-toolsai.jupyter"] in the start settings of vs code.
# So press CTRL+ALT+P -> "Preference: Configure Runtime Arguments" then insert the upper line.
# ALTERNATIVE: Install code-features from aur.
