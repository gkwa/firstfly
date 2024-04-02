#!/usr/bin/env bash

function doit() {
    local image=$1
    local container=$image

    incus rm --force $container
    incus launch $image $container
    incus file push fast.sh $container/root/fast.sh
    incus exec $container -- bash -c 'bash -e /root/fast.sh'
    incus exec $container -- sudo --user linuxbrew --login bash -c 'brew install hello && hello --version'
}

doit homebrew-jammy
doit homebrew-focal
