My Dotfiles
===========

This is a collection of files I have configured for my development environment.
Feel free to use whatever you find useful. However, I recommend
that you understand what settings you are using before applying them to your
own development environment.

Setting up Apps
---------------
In order to run the `brew.sh` setup, simply run `sh brew.sh` while in the `dotfiles`
directory. This will install various applications on a Mac OS which I use.
If you haven't downloaded Homebrew yet, this script will download it for you. You will
likely need to change this file based on which applications you use.
*Note: I still need to make Homebrew check if an application has been installed before downloading
the package for it to save time. All apps should download as expected. It just takes
longer because there is no check whether the app has already been downloaded before proceeding
to download the application and then finding a conflict.*


Setting up Bash Preferences
---------------------------
You may also need to `source .bashrc` in your `.bash_profile` file.

Setting up Mac OS Preferences
-----------------------------
In order to apply the settings for your Mac, you will need to run `source .macos`
while in the `dotfiles` directory.

