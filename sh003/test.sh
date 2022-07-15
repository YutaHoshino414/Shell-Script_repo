#!/usr/bin/bash

spinner=(0ooooo o0oooo oo0ooo ooo0oo oooo0o ooooo0)

spin(){
    for i in "${spinner[@]}"
    do
        printf "\r $i "
        sleep 0.2
    done
}

spin