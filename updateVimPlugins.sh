#!/bin/bash

for directory in ~/.vim/bundle/*
do 
    echo $directory
    cd $directory
    git pull
done

for directory in ~/.vim/plugin/*
do 
    echo $directory
    cd $directory
    git pull
done

