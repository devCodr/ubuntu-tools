# ─────────── BASICS ───────────
alias clr='clear'

# Navegación rápida
alias raiz='cd /'
# alias dgt='cd c:/dgt'
alias dgt='cd /home/chris/dgt'
# alias larico='cd c:/larico'
alias larico='cd /home/chris/larico' 

alias clients='cd c:/clients' 

# ─────────── SERVIDORES ───────────
alias hstart='hugo server -D'
alias ystart='yarn start'
alias ys='yarn run dev'
alias pn='pnpm dev'
alias pn2='pnpm start'
alias start='npm start'

# ─────────── DEPLOY ───────────
alias deploys='npm run deploy'
alias deployp='npm run deploy && vercel --prod'
alias vprod='vercel --prod'

# ─────────── GIT BASICS ───────────
alias clone='git clone $@'
alias status='git status'
alias main='git checkout main'
alias sgt='git checkout staging'

alias pull='git pull && git pull --rebase'

alias staging='git push staging'
alias stagingf='git push staging -f'
alias production='git push production'
alias addst='git remote add staging $@'
alias addprod='git remote add production $@'
alias remotev='git remote -v'

# ─────────── GIT FUNCTIONS ───────────
gitpush() {
    git status
    git add .
    git commit -m "$*"
    git pull --rebase
    git push
}
alias push=gitpush

pushToStaging() {
    git status
    git add .
    git commit -m "$*"
    git pull --rebase 
    git push
    git push staging
}
alias sacpps=pushToStaging

pushToProduction() {
    git status
    git add .
    git commit -m "$*"
    git pull --rebase 
    git push
    git push production
}
alias sacppp=pushToProduction

sendToStaging() { 
    git pull --rebase
    git push
    git push staging
}
alias st=sendToStaging

pushToMain() {
    git pull --rebase
    git push
}
alias push2=pushToMain

# ─────────── SHORTCUT PULLS ───────────
alias pullmain='git pull origin main'
alias pullstg='git pull origin staging'

# ─────────── SHORTCUT COMMITS ───────────
tostg() {
    git status
    git add .
    git commit -m "$*" 
    git push origin staging
}
alias stg=tostg


function code.() {
  code . && exit
}


function repo() {
  url=$(git config --get remote.origin.url)
  if [[ -z "$url" ]]; then
    echo "No git remote origin found."
    return 1
  fi

  url=${url/git@github.com:/https://github.com/}
  url=${url/.git/}

  open_cmd="xdg-open"
  [[ "$OSTYPE" == "darwin"* ]] && open_cmd="open"

  $open_cmd "$url"
}
