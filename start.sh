#! /bin/sh 
export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
export LANG=en_US.UTF-8
#set -e
/usr/bin/clear

echo=echo
for cmd in echo /bin/echo; do
  $cmd >/dev/null 2>&1 || continue
  if ! $cmd -e "" | grep -qE '^-e'; then
    echo=$cmd
    break
  fi
done
CSI=$($echo "\033[")
CEND="${CSI}0m"
CDGREEN="${CSI}32m"
CRED="${CSI}1;31m"
CGREEN="${CSI}1;32m"
CYELLOW="${CSI}1;33m"
CBLUE="${CSI}1;34m"
CMAGENTA="${CSI}1;35m"
CCYAN="${CSI}1;36m"
CSUCCESS="$CDGREEN"
CFAILURE="$CRED"
CQUESTION="$CMAGENTA"
CWARNING="$CYELLOW"
CMSG="$CCYAN"

time=$(date "+%Y-%m-%d %H:%M:%S")
printf "${CBLUE}
##############################################################################
#                            ${time}                             #
##############################################################################
${CEND}" >> /Users/ChiHo/Documents/Projects/Git/weiboSpider/out.log

cd /Users/ChiHo/Documents/Projects/Git/weiboSpider
python3 -m weibo_spider >> /Users/ChiHo/Documents/Projects/Git/weiboSpider/out.log
