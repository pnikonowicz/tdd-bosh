#!/usr/bin/env sh

set -e 

function main() {
    unit_tests
    integration_tests
}

function unit_tests() {
    print_green "running unit tests"
    pushd ./excercises/src/spec
        bundle exec rspec .
    popd
}

function integration_tests() {
    print_green "running integration tests"
    pushd ./excercises/manifests
    
    print_green "running simple bats"
    bosh -e vbox deploy simple.yml -d simple -n \
        && bosh -d simple run-errand run_bats

    print_green "running mock bats"
    bosh -e vbox deploy mock.yml -d mock -n \
        && bosh -d mock run-errand run_bats
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

