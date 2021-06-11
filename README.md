
## Starting with the credits/expiration to create this init.vim: 

By  [Diki Ananta](https://github.com/dikiaap/dotfiles) and [Ben Awad](https://github.com/benawad).

> Tip: Ben Awad, he has a very good and very explanatory video,
that helped me to understand better about nvim and plugins, I recommend watching it for those who are curious about the subject. 
I'll leave it fixed here: [Video](https://www.youtube.com/watch?v=gnupOrSEikQ)

## Getting Started
You'll need will first need `Neovim` , version 0.4.4 or later,
In my case, I use `Arch Linux` as the main system, I'll leave the command to install below,
then I leave the link to the official instructions to install on several other systems.
```
sudo pacman -S neovim  # for Arch.
```
Other systems: [Installing Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)

## Step 1
After cloning it to your computer, put the `init.vim` file and the
  `coc-settings.json` in ` ~ / .config / nvim / `.
If there is already an init.vim file, just replace it with this new file.

> Note: the .zshrc file is optional, it has no influence on neovim, just some settings I use on my terminal.

## Step 2
after doing this procedure run on your `nvim` terminal, after loading enter vim command mode, press `:` , and type:
```
PlugInstall
```
After typing press Enter and it will open a side window to install plugins and themes.
> Note: finishing the plugin installation, close `nvim` and open it again and see if there was at least one change in the theme.

## Step 3
with nvim running, enter command mode again and type the command below
```
CocInstall
```
This command will install the extensions and host language servers of [Conquer Of Completion](https://github.com/neoclide/coc.nvim).

> Note: if you want to know more about it, he already has the official link.


## Step 4
Finishing The installation, enjoy a new text editor or a new configuration, please leave feedback on what I think of the settings, remembering that little by little when I get some free time I take this opportunity to update these settings. 

Enjoy! :smile:
