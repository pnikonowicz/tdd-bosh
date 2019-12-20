#!/usr/bin/env sh

set -e 

function main() {
    unit_tests
    integration_tests
}

function unit_tests() {
    print_green "running unit tests"
    pushd ./stdout/src/spec
        bundle exec rspec .
    popd
}

function integration_tests() {
    print_green "running integration tests"
    pushd ./manifests
    bosh -e vbox deploy stdout.yml -d stdout -n \
        && bosh -d stdout run-errand run_bats
    popd
}

function print_green() {
    local color='\033[0;32m'
    local default='\033[0m'
    local message=${1}
    local seperator=''
    seperator=${seperator}'-'
    for (( i=0; i<${#message}; i++ )); do
        seperator=${seperator}'='    
    done
    seperator=${seperator}'-'

    printf "${color}${seperator}\n ${message}\n${seperator}${default}\n"
}

main

