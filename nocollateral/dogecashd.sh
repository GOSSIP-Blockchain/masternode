#!/bin/bash
# shellcheck disable=SC2034

# Copyright (c) 2019
# All rights reserved.
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND.

: '
# Run this file

```
bash -ic "$(wget -4qO- -o- raw.githubusercontent.com/mikeytown2/masternode/master/nocollateral/dogecashd.sh)" ; source ~/.bashrc
```

'

# Github user and project.
GITHUB_REPO='dogecash/dogecash'
# Display Name.
DAEMON_NAME='DogeCash Core'
# Coin Ticker.
TICKER='DOGE'
# Binary base name.
BIN_BASE='dogecash'
# Directory.
DIRECTORY='.dogecash'
# Conf File.
CONF='dogecash.conf'
# Port.
DEFAULT_PORT=56740
# Explorer URL.
EXPLORER_URL='http://explorer.dogec.xyz/'
# Rate limit explorer.
EXPLORER_SLEEP=1
# Amount of Collateral needed.
COLLATERAL=5000
# Direct Daemon Download if github has no releases.
DAEMON_DOWNLOAD=''
# Blocktime in seconds.
BLOCKTIME=60
# Cycle Daemon on first start.
DAEMON_CYCLE=1
# Multiple on single IP.
MULTI_IP_MODE=1
MASTERNODE_CALLER='getmasternode'
MASTERNODE_NAME='masternode'
MASTERNODE_GENKEY_COMMAND='createmasternodekey'
MASTERNODE_LIST='listmasternodes'


# Tip Address.
TIPS='DTu1fh3F6ujvEoZsqMtFZ31VFJzfkBeUpf'
# Dropbox Addnodes.
DROPBOX_ADDNODES='s0pdil1rehsy4fu'
# Dropbox Bootstrap.
DROPBOX_BOOTSTRAP='rawf808f0hv9jg'
# Dropbox blocks and chainstake folders.
DROPBOX_BLOCKS_N_CHAINS='s4vy92sczk9c10s'

ASCII_ART () {
echo -e "\e[0m"
clear 2> /dev/null
cat << "DOGECASH"
 ____                    ____          _        ____
|  _ \  ___   __ _  ___ / ___|__ _ ___| |__    / ___|___  _ __ ___
| | | |/ _ \ / _` |/ _ \ |   / _` / __| '_ \  | |   / _ \| '__/ _ \
| |_| | (_) | (_| |  __/ |__| (_| \__ \ | | | | |__| (_) | | |  __/
|____/ \___/ \__, |\___|\____\__,_|___/_| |_|  \____\___/|_|  \___|
             |___/

DOGECASH
}

# Discord User Info
# @mcarper#0918
# 401161988744544258
cd ~/ || exit
COUNTER=0
rm -f ~/___mn.sh
while [[ ! -f ~/___mn.sh ]] || [[ $( grep -Fxc "# End of masternode setup script." ~/___mn.sh ) -eq 0 ]]
do
  rm -f ~/___mn.sh
  echo "Downloading Masternode Setup Script."
  wget -4qo- gist.githubusercontent.com/mikeytown2/1637d98130ac7dfbfa4d24bac0598107/raw/mcarper.sh -O ~/___mn.sh
  COUNTER=1
  if [[ "${COUNTER}" -gt 3 ]]
  then
    echo
    echo "Download of masternode setup script failed."
    echo
    exit 1
  fi
done

(
  sleep 2
  rm ~/___mn.sh
) & disown

(
# shellcheck disable=SC1091
# shellcheck source=/root/___mn.sh
. ~/___mn.sh
DAEMON_SETUP_THREAD
)
# shellcheck source=/root/.bashrc
. ~/.bashrc
stty sane 2>/dev/null

