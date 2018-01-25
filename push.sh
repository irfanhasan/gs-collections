#!/bin/sh

my_user_name=irfanhasan
my_repo=gs-collections

setup_git() {
    git config --global user.email "travis@travis-ci.org"
    git config --global user.name "Travis CI"
    mkdir temp
}

commit_files() {
    cd temp
    git init
    git remote add origin https://${GH_TOKEN}@github.com/$my_user_name/${my_repo}-cache.git 
    git pull origin master
    rm -r .ekstazi/
    cp -R ../.ekstazi/ .ekstazi/
    git add -f .ekstazi/*
    git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
    git push -u origin master
}

setup_git
commit_files
upload_files
