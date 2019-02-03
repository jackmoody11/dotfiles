My Dotfiles
===========

This is a collection of files I have configured for my development environment.
Feel free to use whatever you find useful. However, I recommend
that you understand what settings you are using before applying them to your
own development environment.

Setting up Apps
---------------
In order to run the `brew.sh` setup, simply run `sh brew.sh` while in the `dotfiles`
directory. This will install various useful tools which I use.
If you haven't downloaded Homebrew yet, this script will download it for you. You will
likely need to change this file based on which tools (ex: python, java, vim, etc.) you use.

Setting up Mac OS Preferences
-----------------------------
In order to apply the settings for your Mac, you will need to run `sh .macos`
while in the `dotfiles` directory.

Setting up Sublime Text
-----------------------
By default, Sublime Text is setup when running `sh .macos`. However, if you
don't want to use the settings from `.macos`, then you can run the following
commands to setup sublime with the preferences from `init/st3/Preferences.sublime-settings`:

```bash
cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
ln -sf ~/dotfiles/init/st3/Preferences.sublime-settings # overwrite symlink if one already exists
```
