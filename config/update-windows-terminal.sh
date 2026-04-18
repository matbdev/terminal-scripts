#!/usr/bin/env bash

# =========================================================================================
#  SCRIPT INTERATIVO PARA ATUALIZAR O SETTINGS.JSON DO WINDOWS TERMINAL
# =========================================================================================
#
# Este script copia a configuração do Windows Terminal do repositório para o
# local correto no Windows, solicitando o nome de usuário para evitar erros.
#
# =========================================================================================

# Cores e helpers
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
CYAN="\033[0;36m"
RESET="\033[0m"

info() {
    echo -e "${CYAN}[INFO]${RESET} $1"
}

# --- ETAPA 1: SOLICITAR O NOME DE USUÁRIO DO WINDOWS ---

info "Listando possíveis nomes de usuário do Windows encontrados em '/mnt/c/Users':"
# Lista os diretórios, um por linha, para facilitar a leitura
ls -1 /mnt/c/Users | grep -v -e 'Public' -e 'Default' -e 'All Users'
echo

# Pede ao usuário para digitar o nome
read -p "Por favor, digite o seu nome de usuário do Windows exatamente como listado acima: " WINDOWS_USER

# Verifica se o usuário digitou algo
if [ -z "$WINDOWS_USER" ]; then
    echo -e "${YELLOW}Nenhum nome de usuário foi inserido. Saindo.${RESET}"
    exit 1
fi

# --- ETAPA 2: CONSTRUIR E VERIFICAR O CAMINHO ---

# O caminho completo para o arquivo de destino
TARGET_DIR="/mnt/c/Users/${WINDOWS_USER}/AppData/Local/Packages"
TARGET_FILE_PATH_PATTERN="${TARGET_DIR}/Microsoft.WindowsTerminal_*/LocalState/settings.json"

# Encontra o caminho completo, pois a hash do Windows Terminal pode variar
TARGET_FILE=$(find "$TARGET_DIR" -type f -path "$TARGET_FILE_PATH_PATTERN" 2>/dev/null)

# O arquivo de origem no repositório
SOURCE_FILE="$(dirname "$0")/windows-terminal/settings.json"

if [ ! -f "$SOURCE_FILE" ]; then
    echo -e "${YELLOW}ERRO: O arquivo de origem não foi encontrado em '$SOURCE_FILE'. Verifique a estrutura do seu repositório.${RESET}"
    exit 1
fi

# --- ETAPA 3: COPIAR O ARQUIVO ---

if [ -f "$TARGET_FILE" ]; then
    info "Arquivo de destino encontrado em: $TARGET_FILE"
    info "Copiando a nova configuração..."
    
    # Faz um backup da configuração atual antes de sobrescrever
    cp "$TARGET_FILE" "${TARGET_FILE}.bak"
    
    # Copia o novo arquivo
    cp "$SOURCE_FILE" "$TARGET_FILE"
    
    echo -e "${GREEN}Configuração do Windows Terminal atualizada com sucesso!${RESET}"
    echo "Pode ser necessário reiniciar o terminal para ver todas as mudanças."
else
    echo -e "${YELLOW}ERRO: O arquivo 'settings.json' não foi encontrado para o usuário '$WINDOWS_USER'.${RESET}"
    echo "Verifique se:"
    echo "1. O nome de usuário foi digitado corretamente."
    echo "2. O Windows Terminal está instalado."
    exit 1
fi