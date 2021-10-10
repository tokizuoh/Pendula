#!/bin/zsh

# get "github.com/{user_name}/{repository_name}" of "https://github.com/{user_name}/{repository_name}/issue/{issue_number}"
repository_url=`git config --local --get remote.origin.url | sed -e 's/:/\//g' | sed -e 's/.git//g'`
base_url=`echo $repository_url | cut -d '@' -f 2`

# get "{issue_number}" of "https://github.com/{user_name}/{repository_name}/issue/{issue_number}"
issue_number=`git rev-parse --abbrev-ref HEAD | cut -d '#' -f 2`

open "https://${base_url}/issues/${issue_number}"