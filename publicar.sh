#!/usr/bin/env bash
# ═══════════════════════════════════════════════════════════════
#  publicar.sh — Publica o site "Os Três Livros" no GitHub Pages
# ═══════════════════════════════════════════════════════════════
#  Uso:  ./publicar.sh
#
#  O que faz:
#   1. Verifica o token do GitHub (variável GITHUB_TOKEN)
#   2. Cria o repositório "os-tres-livros" na sua conta (se não existir)
#   3. Faz commit e push dos arquivos via SSH
#   4. Ativa o GitHub Pages (branch main, raiz do repositório)
#
#  Pré-requisitos:
#   - git instalado
#   - Chave SSH configurada em ~/.ssh/id_ed25519_github (já existente)
#   - Token do GitHub com escopo "repo":  export GITHUB_TOKEN="ghp_..."
# ═══════════════════════════════════════════════════════════════
set -e

# ── Configurações ───────────────────────────────────────────────
REPO="os-tres-livros"
USER="turiyaterapiaholistica-eng"
SSH_KEY="$HOME/.ssh/id_ed25519_github"
GIT_SSH_COMMAND="ssh -i $SSH_KEY -o IdentitiesOnly=yes -o StrictHostKeyChecking=accept-new"
export GIT_SSH_COMMAND

COR_VERDE='\033[0;32m'; COR_AMARELO='\033[1;33m'; COR_VERMELHO='\033[0;31m'; SEM_COR='\033[0m'
info()  { echo -e "${COR_VERDE}[OK]${SEM_COR} $1"; }
aviso() { echo -e "${COR_AMARELO}[!]${SEM_COR} $1"; }
erro()  { echo -e "${COR_VERMELHO}[ERRO]${SEM_COR} $1"; }

# ── 1. Verificar token ──────────────────────────────────────────
if [ -z "$GITHUB_TOKEN" ]; then
  erro "Variável GITHUB_TOKEN não definida."
  echo ""
  echo "Para criar o repositório, você precisa de um token do GitHub:"
  echo "  github.com → Settings → Developer settings → Personal access tokens"
  echo "  → Tokens (classic) → Generate new token → marque o escopo 'repo'"
  echo ""
  echo "Depois rode:"
  echo "  export GITHUB_TOKEN=\"ghp_...\""
  echo "  ./publicar.sh"
  exit 1
fi

# ── 2. Criar repositório (se não existir) ───────────────────────
if git ls-remote "git@github.com:$USER/$REPO.git" >/dev/null 2>&1; then
  aviso "Repositório '$REPO' já existe. Pulando criação."
else
  info "Criando repositório '$REPO' no GitHub..."
  RESPOSTA=$(curl -s -X POST "https://api.github.com/user/repos" \
    -H "Authorization: token $GITHUB_TOKEN" \
    -H "Accept: application/vnd.github+json" \
    -d "{\"name\":\"$REPO\",\"description\":\"Site oficial da trilogia Felix · Alphus de Altair\",\"public\":true}")
  if echo "$RESPOSTA" | grep -q '"full_name"'; then
    info "Repositório criado com sucesso."
  else
    erro "Não foi possível criar o repositório:"
    echo "$RESPOSTA" | head -5
    exit 1
  fi
fi

# ── 3. Git init / commit / push ─────────────────────────────────
DIR_ATUAL=$(pwd)
cd "$(dirname "$0")"

if [ ! -d .git ]; then
  git init -b main
  info "Repositório local inicializado."
fi

git add -A
if git diff --cached --quiet; then
  aviso "Nenhuma mudança nova para enviar."
else
  git commit -m "Publica site Os Três Livros ($(date +%d/%m/%Y))"
  info "Commit criado."
fi

git remote remove origin 2>/dev/null || true
git remote add origin "git@github.com:$USER/$REPO.git"

if git push -u origin main 2>&1 | grep -q "error\|denied\|fatal"; then
  erro "Falha no push. Verifique se a chave SSH funciona com:"
  echo "  ssh -i $SSH_KEY -T git@github.com"
  exit 1
else
  info "Arquivos enviados para o GitHub."
fi

# ── 4. Ativar GitHub Pages ──────────────────────────────────────
info "Ativando GitHub Pages..."
curl -s -X POST "https://api.github.com/repos/$USER/$REPO/pages" \
  -H "Authorization: token $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json" \
  -d '{"source":{"branch":"main","path":"/"}}' >/dev/null 2>&1 || true

# ── Finalizar ───────────────────────────────────────────────────
info "Publicação concluída!"
echo ""
echo "  Site:  https://$USER.github.io/$REPO/"
echo "  (Aguarde 1–2 minutos para o GitHub gerar o site na primeira vez)"
echo ""
echo "Depois de publicado, para atualizar os links do Hotmart,"
echo "edite o index.html e rode ./publicar.sh novamente."
echo ""
echo "Dica de segurança: você pode revogar o token depois em"
echo "github.com → Settings → Developer settings → Personal access tokens."
