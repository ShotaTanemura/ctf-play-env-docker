FROM ubuntu:22.04

RUN \
    apt-get update && \
    apt-get install -y \
        zsh \
        git \
        curl \
        ca-certificates && \
        rm -rf /var/lib/apt/lists/*
        
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

RUN \
    ZSH_CUSTOM="${ZSH_CUSTOM:-/root/.oh-my-zsh/custom}" && \
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions" && \
    git clone --depth=1 https://github.com/marlonrichert/zsh-autocomplete "$ZSH_CUSTOM/plugins/zsh-autocomplete" && \
    sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-autocomplete)/' /root/.zshrc && \
    chsh -s /usr/bin/zsh

RUN mkdir -p /workspaces
COPY workspaces /workspaces
WORKDIR /workspaces
