#!/bin/bash
#
# LaunchBar Action Script
#

function use_report () {
    host=${1}
    now=$(date +"%Y%m%d-%H%M")

    temp_file=$(mktemp ${host}-${now}-XXXXX)
    output_file="${HOME}/Desktop/${temp_file}.md"
    mv ${temp_file} ${output_file}

    ssh ${host} usereport.py > ${output_file} 2> /dev/null
    ret_val=$?


    open ${output_file}
    echo "{ \"title\": \"USE report for host ${host}\", \"path\": \"${output_file}\" }"

    return ${ret_val}
}

use_report $1

