<p align="center">
  <h1 align="center">Update PR Reminder Action</h1>
  <p align="center">
  <blockquote>A github action to automatically remind pull request authors to update their branch as soon as there is a new commit (or merge) in the base branch</blockquote>
  </p>
</p>

[![PR Update Reminder](https://github.com/Bhupesh-V/update-pr-reminder-action/actions/workflows/self-test.yaml/badge.svg?branch=main)](https://github.com/Bhupesh-V/update-pr-reminder-action/actions/workflows/self-test.yaml)
<a href="https://twitter.com/bhupeshimself">
  <img alt="Twitter: Bhupesh Varshney" src="https://img.shields.io/twitter/follow/bhupeshimself.svg?style=social" target="_blank" />
</a>

## ✨ Demo

![update-pr-reminder-action-demo](https://user-images.githubusercontent.com/34342551/158306923-519008b8-16ab-4117-a597-2b678ebedabd.png)

#### Checkout [this pull request for demo](https://github.com/Bhupesh-V/update-pr-reminder-action/pull/1)

## ❓ Usage

```yaml
name: PR Update Reminder
on:
  push:
    branches:
      - main
      - dev

env:
  # make sure to set this as env
  GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}

jobs:
  remind_authors:
    runs-on: ubuntu-latest
    name: Update PR Reminder Test
    steps:
      - uses: actions/checkout@v2
      - uses: Bhupesh-V/update-pr-reminder-action@main
 ```