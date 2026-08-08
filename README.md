# 📚 Os Três Livros — Site Oficial

Site de apresentação da trilogia **Felix · Alphus de Altair**:

1. **O Retorno de Tiago**
2. **Jornada de Alphus**
3. **Despertando Ajna**

Publicado com GitHub Pages: `https://turiyaterapiaholistica-eng.github.io/3livros/`

---

## 🔗 LINKS DE VENDA (HOTMART)

| Livro | Link de venda | Status |
|---|---|---|
| O Retorno de Tiago | `https://go.hotmart.com/M107078760W?dp=1` | ✅ Ativo |
| Jornada de Alphus | `https://go.hotmart.com/I107041810G?dp=1` | ✅ Ativo |
| Despertando Ajna | `SEU_LINK_HOTMART_AJNA` (placeholder) | ⏳ Pendente |

Para trocar um link, abra o `index.html`, procure por `SEU_LINK_HOTMART` (Ctrl+F) e substitua o texto entre as aspas do `href` pelo link real. Depois publique:

```bash
git add index.html
git commit -m "Atualiza link de venda"
git push
```

Em 1–2 minutos o site estará atualizado.

---

## 🚀 COMO PUBLICAR O SITE (primeira vez)

### Opção A — Rode o script automático

```bash
cd "site-os-tres-livros"
chmod +x publicar.sh
./publicar.sh
```

O script cria o repositório no GitHub (via API), envia os arquivos e ativa o GitHub Pages.

> **Pré-requisito:** ter um token do GitHub com escopo `repo` definido na variável `GITHUB_TOKEN`:
> ```bash
> export GITHUB_TOKEN="seu_token_ghp_..."
> ```

### Opção B — Manual

1. **Crie o repositório** em https://github.com/new
   - Nome: `3livros`
   - Público (obrigatório para o Pages grátis)
   - Não marque "Add a README file"
2. **Envie os arquivos:**
   ```bash
   cd "site-os-tres-livros"
   git remote add origin git@github.com:turiyaterapiaholistica-eng/3livros.git
   git branch -M main
   git push -u origin main
   ```
3. **Ative o GitHub Pages:**
   - GitHub → repositório `3livros` → **Settings** → **Pages**
   - Em "Source", escolha **Deploy from a branch** → branch **main** → pasta **/ (root)** → **Save**
4. Aguarde 1–2 minutos. O site estará em:
   `https://turiyaterapiaholistica-eng.github.io/3livros/`

---

## 📁 Estrutura do projeto

```
site-os-tres-livros/
├── index.html    ← O site (é aqui que você troca os links do Hotmart)
├── publicar.sh   ← Script que publica tudo automaticamente
└── README.md     ← Este guia
```

## ✏️ COMO ATUALIZAR O SITE DEPOIS (textos, capa, etc.)

1. Edite o `index.html`
2. Salve e publique:
   ```bash
   git add index.html
   git commit -m "Atualiza site"
   git push
   ```

---

© 2026 · Felix · Alphus de Altair · Todos os direitos reservados
