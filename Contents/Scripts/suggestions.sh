#!/bin/bash
#
# LaunchBar Action Script
#
cat ~/.ssh/known_hosts | awk '{ print $1 }' | tr ',' '\n' | grep "$1"
