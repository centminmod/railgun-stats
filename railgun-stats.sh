#!/bin/bash
#########################################################
# cloudflare railgun stats push to slack channel
# https://www.cloudflare.com/website-optimization/railgun/
# https://www.cloudflare.com/docs/railgun/administration.html
# written by George Liu (eva2000) https://centminmod.com
#########################################################
# variables
#############
VER=0.1
DT=$(date +"%d%m%y-%H%M%S")
SLACK='n'

# Slack settings
TIMESTAMP=$(date +"%s")
webhook_url=''                              # Incoming Webhooks integration URL
channel="your-slack-channel-name"           # Default channel to post messages. '#' is prepended
username="your-slack-channel-post-username" # Default username to post messages.
icon="cf"                                   # Default emoji to post messages. Don't wrap it with ':'. See http://www.emoji-cheat-sheet.com; can be a url too.
slack_fallback='railgun stats'                    # message title
slack_title="$slack_fallback"
slack_message_title="$slack_title"
slack_footer=$(basename "$0")        # message footer
message_color='#71bb30'                     # message colour

# message where railgun listener on port 24088
railgun_statsport='24088'

# memcached stats
memc_stats=$(echo stats | nc 127.0.0.1 11211)
#########################################################
# functions
#############

if [ -f railguninc.ini ]; then
  . railguninc.ini
fi

send_slack() {
  curl -X POST --data-urlencode "payload={\"channel\": \"#$channel\", \"username\": \"$username\", \"icon_emoji\": \":$icon:\", \"attachments\": [ { \"fallback\": \"${slack_fallback}\", \"color\": \"$message_color\", \"ts\": \"$TIMESTAMP\", \"footer\": \"$slack_footer\", \"fields\": [{ \"title\": \"$slack_message_title\", \"value\": \"${message}\", \"short\": false }] } ]}" $webhook_url

  slack_fallback='railgun memcached stats'
  slack_title="$slack_fallback"
  slack_message_title="$slack_title"
  curl -X POST --data-urlencode "payload={\"channel\": \"#$channel\", \"username\": \"$username\", \"icon_emoji\": \":$icon:\", \"attachments\": [ { \"fallback\": \"${slack_fallback}\", \"color\": \"$message_color\", \"ts\": \"$TIMESTAMP\", \"footer\": \"$slack_footer\", \"fields\": [{ \"title\": \"$slack_message_title\", \"value\": \"${memc_stats}\", \"short\": false }] } ]}" $webhook_url
}

get_stats() {
  if [[ "$SLACK" = [yY] ]]; then
    message=$(curl -s http://127.0.0.1:$railgun_statsport/ 2>&1 | jq '.' | sed -e 's|{||' -e 's|}||' -e 's|"||g' | tr -s ' ')
    send_slack
    echo
    echo "Railgun stats"
    echo "$message"
    echo
    echo "Memcached stats"
    echo "$memc_stats"
  else
    message=$(curl -s http://127.0.0.1:$railgun_statsport/ 2>&1 | jq '.' | sed -e 's|{||' -e 's|}||' -e 's|"||g' | tr -s ' ')
    echo "Railgun stats"
    echo "$message"
    echo
    echo "Memcached stats"
    echo "$memc_stats"
  fi
}
#########################################################
case $1 in
  stats )
    get_stats
    ;;
  pattern )
    ;;
  pattern )
    ;;
  pattern )
    ;;
  pattern )
    ;;
  * )
    echo "$0 {stats}"
    ;;
esac
exit
