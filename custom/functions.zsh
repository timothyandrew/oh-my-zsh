bootcamp() {
    sudo bless -mount "/Volumes/BOOTCAMP/" -legacy -setBoot -nextonly; sudo shutdown -r now
}

speedtest() {
    wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip
}

settitle() {
    echo -ne "\e]1;$1\a"
}

killgrep() {
    for x in `ps ax | grep $1 | awk '{print $1}'`; do kill -9 $x; done
}

function test_and_push() {
    bundle exec rake && git push -u origin `git rev-parse --abbrev-ref HEAD`
}

function parallel_test_and_push() {
    rake parallel:test && git push -u origin `git rev-parse --abbrev-ref HEAD`
}

function migrate() {
    rake db:migrate
}

function setup_seedbox() {
    ssh root@"$1" "cd /tmp; wget http://github.com/timothyandrew/seedbox/archive/master.tar.gz; tar -xzvf master.tar.gz; mv seedbox-master seedbox; cd seedbox; sh seedbox-setup.sh"
}

function emacs() {
    open -a /Applications/Emacs.app -n $1
}

function latest_promo_bank() {
    ssh staples@ftp.runa.com "cat \`ls -rt /ftp_home/staples/email/promo-bank*csv | tail -n1\` | head -n ${1:-10}"
}

function emacs_plus_icon() {
    cp /Applications/Emacs.app/Contents/Resources/Emacs.icns{,.bak}
    cp "$2" /Applications/Emacs.app/Contents/Resources/Emacs.icns
    open -a /Applications/Emacs.app -n $1
    #cp /Applications/Emacs.app/Contents/Resources/Emacs.icns{.bak,}
}

function backup_photos() {
    unset PYTHONPATH
    echo "Making new backup."
    attic create /Volumes/Misc/Backups/Photo\ Library.attic::`date +%Y-%m-%d-%H:%M` ~/Pictures/Photo\ Library
    echo "Pruning older backups."
    attic prune /Volumes/Misc/Backups/Photo\ Library.attic --keep-weekly 2 --keep-monthly 4 --keep-yearly 10
}
