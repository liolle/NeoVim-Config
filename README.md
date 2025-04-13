# NeoVim-Config

### Clone
```bash
sudo git clone https://github.com/liolle/NeoVim-Config.git ~/.config/nvim
```

### Dependencies

##### Git 
```bash
sudo apt update && \
sudo apt install git -y && \
git config --global user.name "Your Name" && \
git config --global user.email "your.email@example.com"```
```

##### NeoVim 
```bash
sudo apt update && \
sudo apt install neovim
```
- From github
  ```
  # Remove old Neovim (if installed)
  sudo apt remove neovim neovim-runtime -y && \
  # Install dependencies
  sudo apt install curl wget fuse libfuse2 tar -y && \
  # Download and extract the latest stable Neovim (AppImage)
  curl -LO https://github.com/neovim/neovim/releases/download/stable/<image> && \
  chmod u+x <image> && \
  sudo mv <image> /usr/bin/nvim 
  ```
