#!/bin/bash

# echo "::set-output name=short_ref::${GITHUB_REF#refs/*/}"

all_open_prs=$(gh pr list --base "${GITHUB_REF#refs/*/}" --json author,number)
printf "%s\n" "PRs with base ${GITHUB_REF#refs/*/}: $all_open_prs"
prs_count=$(echo "$all_open_prs" | jq length)
printf "%s\n" "There are currently $prs_count open PRs"

for (( c=0; c<$prs_count; c++ )); do
    pr_id=$(echo "$all_open_prs" | jq .["$c"].number)
    author=$(echo "$all_open_prs" | jq .["$c"].author.login | tr -d '"')
    echo "Author for PR $pr_id is $author"
    gh pr comment $pr_id --body "Hey @$author 👋🏽 friendly reminder to update your PR/branch because there was a recent commit ($(git rev-parse HEAD)) to the base branch"
done