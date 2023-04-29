# garust-debian

GitHub Action to running Rust binary on Debian Bulls Eye using SSH `rsync`.

## Supported runners

`ubuntu-20.04`

[What is my Debian in my Ubuntu?](https://askubuntu.com/a/445496/513710).

## Input

```yaml
inputs:
  working-directory:
    description: "Working directory for the build."
    required: true
  binary-name:
    description: "Name of the binary to run."
    required: true
  ssh-user:
    description: "SSH user."
    required: true
  ssh-host:
    description: "SSH host."
    required: true
  ssh-private-key:
    description: "SSH private key."
    required: true
  ssh-known-hosts:
    description: "SSH known hosts."
    required: true
```

## Example

```yaml
name: "Build and release"

on:
  push:
    branches:
      - main

jobs:
  build-and-release:
    runs-on: ubuntu-20.04
    steps:
      - uses: setoelkahfi/garust-debian@v1
        with: Install Rust stable
            ssh-key: ${{ secrets.SSH_PRIVATE_KEY }}
            ssh-known-hosts: ${{ secrets.SSH_KNOWN_HOSTS }}
            ssh-user: ${{ secrets.SSH_USER }}
            ssh-host: ${{ secrets.SSH_HOST }}
            project-directory: ${{ secrets.PROJECT_DIRECTORY }}
            project-name: ${{ secrets.PROJECT_NAME }}

```