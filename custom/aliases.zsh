alias ggprnp="git pull --rebase && git push"
alias rdbtp="rake db:test:prepare"
alias gphm="git push heroku master"
alias pg="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log"
alias grep="grep -i"
alias usedmem="ps -ax -o rss,command | awk '{sum+=\$1} END {printf \"%9.3f %s\n\", sum/1024, \"MB\" }'"
alias push="git pull --rebase && bundle && ((rake parallel || rake) || afplay /System/Library/Sounds/Sosumi.aiffi) && rake konacha:run && git push && afplay /System/Library/Sounds/Glass.aiff"
alias ast="gst --porcelain | grep -v '^\sT'" # Git annex status
alias t="trash"
alias git-word-diff='git diff --word-diff --word-diff-regex=:'
alias firefox='/Applications/Firefox.app/Contents/MacOS/firefox-bin -P Tim -no-remote > /dev/null &'
alias work_firefox='/Applications/Firefox\ Work.app/Contents/MacOS/firefox-bin -P Work -no-remote > /dev/null &'