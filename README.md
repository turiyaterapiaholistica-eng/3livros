# 📚 Os Três Livros — Site Oficial

Site de apresentação da trilogia **Felix · Alphus de Altair**:

1. **O Retorno de Tiago**
2. **Jornada de Alphus**
3. **Despertando Ajna**

Publicado com GitHub Pages: `https://turiyaterapiaholistica-eng.github.io/os-tres-livros/`

---

## 🔗 COMO ADICIONAR OS LINKS DO HOTMART (quando lançar os livros)

Os botões de compra ainda têm links provisórios (`SEU_LINK_HOTMART_TIAGO`, etc.) porque os produtos ainda não foram lançados no Hotmart.

Quando você tiver os links reais, **basta seguir estes passos**:

### Passo 1 — Editar o arquivo `index.html`

Abra o arquivo `index.html` com qualquer editor de texto (Bloco de Notas, Obsidian, VS Code).

Procure por **`SEU_LINK_HOTMART`** (use Ctrl+F / buscar).

Você verá 3 trechos assim:

```html
<!-- ⚠️ LINK DO HOTMART (LIVRO 1): troque SEU_LINK_HOTMART_TIAGO pelo link real... -->
<a href="SEU_LINK_HOTMART_TIAGO" target="_blank" rel="noopener" class="book-cta">
```

### Passo 2 — Trocar o link

Substitua apenas o texto entre as aspas do `href`:

| Livro | Antes | Depois (exemplo) |
|---|---|---|
| O Retorno de Tiago | `href="SEU_LINK_HOTMART_TIAGO"` | `href="https://pay.hotmart.com/A12345678"` |
| Jornada de Alphus | `href="SEU_LINK_HOTMART_ALPHUS"` | `href="https://pay.hotmart.com/B12345678"` |
| Despertando Ajna | `href="SEU_LINK_HOTMART_AJNA"` | `href="https://pay.hotmart.com/C12345678"` |

> 💡 **Dica:** no Hotmart, o link de venda aparece na área **"Produto → Vender → Link de vendas"**. Use o link que começa com `https://pay.hotmart.com/...` (o link de pagamento direto) ou o link da sua página de vendas.

### Passo 3 — Salvar e publicar

Salve o arquivo. Depois:

- **Se você usa o terminal:** rode o script abaixo na pasta do projeto:
  ```bash
  ./publicar.sh
  ```
- Ou faça commit manualmente:
  ```bash
  git add index.html
  git commit -m "Adiciona link do Hotmart"
  git push
  ```

Em 1–2 minutos o site estará atualizado no endereço acima.

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
   - Nome: `os-tres-livros`
   - Público (obrigatório para o Pages grátis)
   - Não marque "Add a README file"
2. **Envie os arquivos:**
   ```bash
   cd "site-os-tres-livros"
   git remote add origin git@github.com:turiyaterapiaholistica-eng/os-tres-livros.git
   git branch -M main
   git push -u origin main
   ```
3. **Ative o GitHub Pages:**
   - GitHub → repositório `os-tres-livros` → **Settings** → **Pages**
   - Em "Source", escolha **Deploy from a branch** → branch **main** → pasta **/ (root)** → **Save**
4. Aguarde 1–2 minutos. O site estará em:
   `https://turiyaterapiaholistica-eng.github.io/os-tres-livros/`

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
