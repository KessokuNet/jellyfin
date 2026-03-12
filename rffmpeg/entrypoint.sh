#!/bin/bash -eu
# timezone bullshit
ln -fs /usr/share/zoneinfo/${TZ} /etc/localtime


# Populate host keys file at /var/ssh
if [ ! -f /var/ssh/ssh_host_rsa_key ]; then
    ssh-keygen -t rsa -f /var/ssh/ssh_host_rsa_key -N ''
fi
if [ ! -f /var/ssh/ssh_host_ecdsa_key ]; then
    ssh-keygen -t ecdsa -f /var/ssh/ssh_host_ecdsa_key -N ''
fi
if [ ! -f /var/ssh/ssh_host_ed25519_key ]; then
    ssh-keygen -t ed25519 -f /var/ssh/ssh_host_ed25519_key -N ''
fi

exec "$@"
