#!/usr/bin/env bash
set -euo pipefail

PINK="\e[35m"
WHITE="\e[0m"
YELLOW="\e[33m"
GREEN="\e[32m"
RED="\e[31m"

start_time=$(date +%s)


echo -e "${PINK}
 **********************************************************************
 * ⚠️  \e[1;4mWARNING\e[0m${PINK}:                                    *
 * This script will modify your system!                               *
 * It will install Hyprland and several dependencies.                 *
 * Make sure you know what you are doing before continuing.           *
 **********************************************************************
\n${WHITE}"
