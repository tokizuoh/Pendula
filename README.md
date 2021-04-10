# Pendula
Repository for verification related to iOS apps.
  
## Xcode
  
```bash
> xcodebuild -version
Xcode 12.3
Build version 12C33
```
  
## Setup
  
```bash
> brew install mint
> mint --version
Version: 0.14.2
```
  
```bash
> git clone git@github.com:tokizuoh/Pendula.git
> cd Pendula
> mint bootstrap
> mint run xcodegen
> xed .
```
  
## Improve development
  
### Do xcodegen at checkout
  
1. Write the following content in `.git/hooks/post-checkout`.  
  
```bash
#!/bin/zsh
sh ./scripts/setup.sh
```
  
2. Grant permission to shell-script.  
```bash
chmod +x .git/hooks/post-checkout
```
  
### Add commit-message an issue number
  
1. Write the content of the following file in `.git/hooks/commit-msg`.  
  
  - `./scripts/hooks/commit-msg`
  
2. Grant permission to shell-script.  
  
```bash
chmod +x .git/hooks/commit-msg
```
  