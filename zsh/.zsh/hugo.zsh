#!/bin/zsh

alias blog="blog-with-date"
function blog-with-date() {
    cd ~/Documents/Note/Blog/post/$1/$2
}
alias hugodir="cd /Users/Clloz/Documents/Note/github-pages"
alias writting="write-hugo-post"
function write-hugo-post() {
    cd ~/Documents/Note/github-pages
    if [ -f "/Users/Clloz/Documents/Note/github-pages/content/posts/$1/index.md" ]; then
        typora ~/Documents/Note/github-pages/content/posts/$1/index.md
    else
        hugo new posts/$1/index.md && typora ~/Documents/Note/github-pages/content/posts/$1/index.md
    fi
}
