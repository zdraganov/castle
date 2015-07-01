# aliases for listing
alias ll='ls -lahF'
alias gg='git status -s'
alias li='ls -hAlFi'

## dooh!
alias sl='ls'
alias ks='ls'
alias LS='ls'

## other useful/useless aliases
alias rm='rm -rf'
alias grep='grep --color=auto'
alias df='df -h'
alias du='du -h'
alias dirsize='du -csh'

## util-linux-ng's rename is lame, perl's one is way better
alias rename='prename'

## i hate the .viminfo
alias vim='vim -i NONE'

## fix some other typos i make intensively
alias CD='cd'
alias cd..='cd ..'

## rails!
alias r='rails'
alias rc='rails console'
alias c='rails console'
alias rs='rails server'
alias s='rails server'
alias rg='rails generate'
alias g='rails generate'
alias bundel='bundle'
alias rdm='rake db:migrate'

## for the man
alias fs='foreman start'
alias fc='foreman run rails console'

## some administrative ones
alias su='sudo su'
alias chown='sudo chown'

# Artisan aliases
alias pa="php artisan"
alias par="php artisan routes"
alias pam="php artisan migrate"
alias pam:r="php artisan migrate:refresh"
alias pam:roll="php artisan migrate:rollback"
alias pam:rs="php artisan migrate:refresh --seed"
alias pda="php artisan dumpautoload"

# Composer aliases
alias cu="composer update"
alias ci="composer install"
alias cda="composer dump-autoload -o"

# Some coverage isn't bad
alias cov_rspec="COVERAGE=true rspec"

# Start mongo with default db path
alias mongostart="mongod --dbpath ~/.mongo/db"
