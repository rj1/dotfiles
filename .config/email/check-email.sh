#!/bin/zsh
# source env vars for cronjob
source ~/.config/zsh/.zprofile

CHECK_GPG=$(gpg-connect-agent 'keyinfo --list' /bye 2>/dev/null | awk 'BEGIN{CACHED=0} /^S/ {if($7==1){CACHED=1}} END{if($0!=""){print CACHED} else {print "none"}}')
if [ $CHECK_GPG != "1" ]; then
    /usr/bin/notify-send "mail" "please restore gpg cache"
    kill -INT $$
fi

# download mail from remotes
if [ $# -eq -0 ]; then
    /usr/bin/mbsync -c /home/rj1/.config/mbsync/config -aV
else
    /usr/bin/mbsync -c /home/rj1/.config/mbsync/config -V $1
fi

# add mail to notmuch db
/usr/bin/notmuch new

# do some tagging
/usr/bin/notmuch tag +inbox -- folder:/inbox/ and tag:new
/usr/bin/notmuch tag +notify -- folder:/inbox/ and tag:new
/usr/bin/notmuch tag -new -- tag:new

# notify
SEARCH="tag:notify"

NOTIFY_COUNT=$(/usr/bin/notmuch count "$SEARCH")

if [ "$NOTIFY_COUNT" -gt 0 ]; then
  RESULTS=$(/usr/bin/notmuch search --format=json --output=summary --limit=3 --sort="newest-first" "$SEARCH" | jq -r '.[] | "\(.authors): \(.subject)"')
  /usr/bin/notify-send "$NOTIFY_COUNT new mails:" "$RESULTS"
fi

/usr/bin/notmuch tag -notify -- tag:notify

# refresh alot buffer if it's open
pkill --signal SIGUSR1 alot
