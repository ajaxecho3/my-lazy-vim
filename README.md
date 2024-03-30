# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

### Windows

# Backup the existing nvim folder
# required
`Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak `

# optional but recommended
`Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak`

# clone my lazy vim setup
`git clone https://github.com/ajaxecho3/my-lazy-vim $env:LOCALAPPDATA\nvim `


#Remove the .git folder
`Remove-Item $env:LOCALAPPDATA\nvim\.git -Recurse -Force`

### Linux and MacOS

# Backup the existing nvim folder (optional)

``` 
# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak} 
```

# clone my lazy vim setup
` git clone https://github:com/ajaxecho3/my-lazy-vim ~/.config/nvim `

# Remove the .git folder
`
rm -rf ~/.config/nvim/.git `
