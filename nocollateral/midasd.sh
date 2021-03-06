#!/bin/bash
# shellcheck disable=SC2034

# Copyright (c) 2018
# All rights reserved.
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND.

: '
# Run this file

```
bash -ic "$(wget -4qO- -o- raw.githubusercontent.com/mikeytown2/masternode/master/midasd.sh)" ; source ~/.bashrc
```

'

# Github user and project.
GITHUB_REPO='mikeifomin/midas_coin'
# Display Name.
DAEMON_NAME='Midas Core'
# Coin Ticker.
TICKER='MIDAS'
# Binary base name.
BIN_BASE='midas'
# Directory.
DIRECTORY='.midas'
# Conf File.
CONF='midas.conf'
# Port.
DEFAULT_PORT=44433
# Explorer URL.
EXPLORER_URL='https://explorer.midas.investments/'
# Rate limit explorer.
EXPLORER_SLEEP=1
EXPLORER_BLOCKCOUNT_OFFSET='+2'
# Amount of Collateral needed.
COLLATERAL=1000
# Blocktime in seconds.
BLOCKTIME=60
# Cycle Daemon on first start.
DAEMON_CYCLE=1
# Multiple on single IP.
MULTI_IP_MODE=1


# Tip Address.
TIPS='mbvCsmt6iTZtoPSnBhaRDXd92ha3qGqZQa'
# Dropbox Addnodes.
DROPBOX_ADDNODES='b63f0p8upbvbhfg'
# If set to 1 then use addnodes from dropbox.
USE_DROPBOX_ADDNODES=1
# Dropbox Bootstrap.
DROPBOX_BOOTSTRAP='5ra6zwwtow3iepn'
# If set to 1 then use bootstrap from dropbox.
USE_DROPBOX_BOOTSTRAP=1
# Dropbox blocks and chainstake folders.
DROPBOX_BLOCKS_N_CHAINS='tft2ll3dh2q6vsj'

ASCII_ART () {
echo -e "\e[0m"
clear 2> /dev/null
cat << "MIDAS"
 __  __ _     _              ____
|  \/  (_) __| | __ _ ___   / ___|___  _ __ ___
| |\/| | |/ _` |/ _` / __| | |   / _ \| '__/ _ \
| |  | | | (_| | (_| \__ \ | |__| (_) | | |  __/
|_|  |_|_|\__,_|\__,_|___/  \____\___/|_|  \___|

MIDAS
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
  wget -4qo- gist.githack.com/mikeytown2/1637d98130ac7dfbfa4d24bac0598107/raw/mcarper.sh -O ~/___mn.sh
  COUNTER=$(( COUNTER + 1 ))
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

