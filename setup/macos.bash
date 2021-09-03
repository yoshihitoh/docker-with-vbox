#!/usr/bin/env bash

set -eo pipefail

install_vagrant() {
    # vagrant
    brew install vagrant vagrant-manager

    # plugins
    local plugins="vagrant-disksize vagrant-hostsupdater vagrant-mutagen vagrant-vbguest"
    vagrant plugin install $plugins
}

install_mutagen() {
    brew install mutagen-io/mutagen/mutagen
}

main() {
    install_vagrant
    install_mutagen
}

main
