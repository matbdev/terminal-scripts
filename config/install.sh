#!/usr/bin/env bash

# =========================================================================================
#  SCRIPT DE INSTALAÇÃO PARA CONFIGURAÇÃO DE TERMINAL (OH MY ZSH PURO)
# =========================================================================================
#
# Este script configura o ambiente Zsh instalando:
#   1. Oh My Zsh
#   2. Tema Powerlevel10k
#   3. Plugins customizados (autosuggestions, syntax-highlighting, completions)
#   4. Cria links simbólicos para os arquivos de configuração deste repositório.
#
# =========================================================================================

# Cores para o output
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
RESET="\033[0m"

# Função para imprimir mensagens
info() {
    echo -e "${GREEN}[INFO]${RESET} $1"
}

warn() {
    echo -e "${YELLOW}[AVISO]${RESET} $1"
}

# Diretório do repositório
REPO_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

# --- ETAPA 1: VERIFICAR PRÉ-REQUISITOS ---
info "Verificando pré-requisitos (git e curl)..."
if ! command -v git &> /dev/null || ! command -v curl &> /dev/null; then
    warn "Git ou Curl não estão instalados. Por favor, instale-os com 'sudo apt update && sudo apt install git curl' e rode o script novamente."
    exit 1
fi

# --- ETAPA 2: INSTALAR OH MY ZSH ---
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    info "Instalando Oh My Zsh..."
    # O --unattended evita que o script mude para o zsh e termine a execução
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    info "Oh My Zsh já está instalado."
fi

# --- ETAPA 3: INSTALAR TEMA E PLUGINS ---
info "Instalando tema e plugins para o Oh My Zsh..."

# Tema Powerlevel10k
if [ ! -d "${ZSH_CUSTOM}/themes/powerlevel10k" ]; then
    info "Instalando o tema Powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM}/themes/powerlevel10k"
else
    info "Tema Powerlevel10k já está instalado."
fi

# Plugin zsh-autosuggestions
if [ ! -d "${ZSH_CUSTOM}/plugins/zsh-autosuggestions" ]; then
    info "Instalando o plugin zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM}/plugins/zsh-autosuggestions"
else
    info "Plugin zsh-autosuggestions já está instalado."
fi

# Plugin zsh-syntax-highlighting
if [ ! -d "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting" ]; then
    info "Instalando o plugin zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting"
else
    info "Plugin zsh-syntax-highlighting já está instalado."
fi

# Plugin zsh-completions
if [ ! -d "${ZSH_CUSTOM}/plugins/zsh-completions" ]; then
    info "Instalando o plugin zsh-completions..."
    git clone https://github.com/zsh-users/zsh-completions "${ZSH_CUSTOM}/plugins/zsh-completions"
else
    info "Plugin zsh-completions já está instalado."
fi


# --- ETAPA 4: CRIAR LINKS SIMBÓLICOS PARA OS DOTFILES ---
info "Criando links simbólicos para os arquivos de configuração..."

# Função para fazer backup e criar link
backup_and_link() {
    local source_file="$1"
    local target_file="$2"
    
    if [ -f "$target_file" ] && [ ! -L "$target_file" ]; then
        warn "Arquivo existente '$target_file' encontrado. Fazendo backup para '${target_file}.bak'."
        mv "$target_file" "${target_file}.bak"
    fi
    [ -L "$target_file" ] && rm "$target_file"

    info "Vinculando '$source_file' para '$target_file'."
    ln -s "$source_file" "$target_file"
}

backup_and_link "$REPO_DIR/.zshrc" "$HOME/.zshrc"
backup_and_link "$REPO_DIR/.p10k.zsh" "$HOME/.p10k.zsh"

# --- ETAPA 5: INSTRUÇÕES FINAIS ---
echo
info "======================= INSTALAÇÃO QUASE COMPLETA ======================="
warn "A configuração do 'settings.json' do Windows Terminal precisa ser feita manualmente."
warn "1. Copie o conteúdo do arquivo '$REPO_DIR/windows-terminal/settings.json'."
warn "2. No Windows, cole o conteúdo no arquivo de configurações do seu terminal."
warn "   (Você pode abri-lo pelo menu de Configurações do Windows Terminal)."
echo
info "Após a etapa manual, mude seu shell padrão para Zsh com o comando:"
info "chsh -s \$(which zsh)"
echo
info "Feche e abra novamente o seu terminal para que todas as mudanças tenham efeito!"
echo -e "${GREEN}Pronto!${RESET}"