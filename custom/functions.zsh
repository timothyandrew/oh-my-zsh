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
    (nohup /usr/bin/emacs $1 &)
}

function airtel_balance() {
    OUTPUT=`curl -sL http://122.160.230.125:8080/planupdate/ | grep -i "Available balance\|High speed data limit" -A1 | sed '2p;5p;d' | sed -e 's/<span>//' -e 's/<\/span>//' -e 's/<\/div>//' | sed -e 's/^ *//' -e 's/ *$//'`
    REMAIN=`echo $OUTPUT | sed '1p;d' | tr -d '\r'`
    LIMIT=`echo $OUTPUT | sed '2p;d' | tr -d '\r'`
    echo "${REMAIN} / ${LIMIT}"
}
