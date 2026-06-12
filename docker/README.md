# Instructions
Run this command from your home directory:
```bash
docker run -it --rm -e TERM=xterm-256color --mount type=bind,source=$(pwd)/dotfiles,target=/home/hehe/dotfiles dotfiles_test_image:latest 
```
