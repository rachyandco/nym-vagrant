#!/bin/sh

myip="$(dig +short myip.opendns.com @resolver1.opendns.com)"
mylocalip="$(hostname -I | awk '{print $2}')"
~/nym/target/release/nym-mixnode run --layer 1 --announce-host ${myip} --host ${mylocalip}