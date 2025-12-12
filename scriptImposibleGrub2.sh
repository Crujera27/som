#!/bin/bash

if [[ -f /usr/bin/apt ]]; then
    DISTRO="Ubuntu"
else
    DISTRO="Fedora"
fi

FECHA=$(date +%Y%m%d)
ARCHIVO="$HOME/configuracionGrub-$DISTRO-$FECHA.tar.gz"

tar -czf "$ARCHIVO" /etc/default/grub 2>/dev/null

if [[ $? -eq 0 ]]; then
    echo "OK: $ARCHIVO"
else
    echo "Error"
    exit 1
fi

exit 0
