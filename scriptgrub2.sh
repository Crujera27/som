#!/bin/bash

if [[ $# -ne 2 ]]; then
    echo "Error. Debes especificar Ubuntu|Fedora y fileManager|internetBrowser|packageManager|desktopVersion"
    exit 1
fi

OS=$1
if [[ "$OS" != "Ubuntu" && "$OS" != "Fedora" ]]; then
     echo "Error. Debes especificar Ubuntu|Fedora y fileManager|internetBrowser|packageManager|desktopVersion"
    exit 1
fi

APP_TYPE=$2
if [[ "$APP_TYPE" != "fileManager" && "$APP_TYPE" != "internetBrowser" && "$APP_TYPE" != "packageManager" && "$APP_TYPE" != "desktopVersion" ]]; then
    echo "Error. El segundo argumento solamente puede ser: fileManager|internetBrowser|packageManager|desktopVersion"
    exit 1
fi

if [[ "$OS" = "Ubuntu" ]]; then
    if [[ "$APP_TYPE" = "fileManager" ]]; then
        echo "Nautilus"
    elif [[ "$APP_TYPE" = "internetBrowser" ]]; then
        echo "Firefox"
    elif [[ "$APP_TYPE" = "packageManager" ]]; then
        echo "APT"
    elif [[ "$APP_TYPE" = "desktopVersion" ]]; then
        echo "GNOME"
    fi
elif [[ "$OS" = "Fedora" ]]; then
    if [[ "$APP_TYPE" = "fileManager" ]]; then
        echo "Nautilus / Dolphin"
    elif [[ "$APP_TYPE" = "internetBrowser" ]]; then
        echo "Firefox"
    elif [[ "$APP_TYPE" = "packageManager" ]]; then
        echo "DNF / YUM"
    elif [[ "$APP_TYPE" = "desktopVersion" ]]; then
        echo "GNOME / KDE PLASMA"
    fi
fi

exit 0
