# Pendula
  
![Pendula](https://socialify.git.ci/tokizuoh/Pendula/image?description=1&font=Inter&language=1&logo=https%3A%2F%2Fuser-images.githubusercontent.com%2F37968814%2F119221357-ebdb4080-bb29-11eb-9474-ed254d7627b8.png&owner=1&pattern=Charlie%20Brown&theme=Light)
  
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
  